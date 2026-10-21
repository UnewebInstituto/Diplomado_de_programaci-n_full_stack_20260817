require('dotenv').config();
const express = require('express');
const path = require('path');
const fs = require('fs');
const { GoogleGenAI } = require('@google/genai');

const app = express();
const port = process.env.PORT || 3000;
const logFilePath = path.join(__dirname, 'auditoria.log');

function registrarPregunta(pregunta) {
  const now = new Date();
  const fecha = now.toISOString().split('T')[0];
  const hora = now.toTimeString().split(' ')[0];
  const linea = `[${fecha}] [${hora}] ${pregunta.trim()}\n`;
  fs.appendFileSync(logFilePath, linea, 'utf8');
}

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

function extractTextFromResponse(response) {
  if (!response) return 'No se obtuvo respuesta de Gemini.';

  if (typeof response.text === 'string' && response.text.trim()) {
    return response.text;
  }

  if (typeof response.output_text === 'string' && response.output_text.trim()) {
    return response.output_text;
  }

  const candidates = response?.candidates || [];
  const parts = candidates[0]?.content?.parts || [];

  return parts
    .map(part => part?.text || '')
    .join('')
    .trim() || 'No se obtuvo respuesta de Gemini.';
}

function buildPromptWithHistory(prompt, history = []) {
  if (!history.length) return prompt;

  const historyText = history
    .slice(-8)
    .map(item => `${item.role === 'user' ? 'Usuario' : 'Asistente'}: ${item.content}`)
    .join('\n');

  return `Historial de conversación:\n${historyText}\n\nUsuario: ${prompt}\nAsistente:`;
}

app.get('/api/health', (req, res) => {
  res.json({ ok: true, message: 'Servidor funcionando correctamente.' });
});

app.post('/api/chat', async (req, res) => {
  const { prompt, history = [] } = req.body || {};

  if (!prompt || !prompt.trim()) {
    return res.status(400).json({
      error: 'Debes enviar un texto para consultar a Gemini.'
    });
  }

  registrarPregunta(prompt);

  const apiKey = process.env.GEMINI_API_KEY;

  if (!apiKey) {
    return res.status(500).json({
      error: 'No se encontró la GEMINI_API_KEY en el archivo .env.'
    });
  }

  const ai = new GoogleGenAI({ apiKey });
  const modelCandidates = ['gemini-3.8-flash', 'gemini-3.5-flash-lite', 'gemini-3.5-flash'];
  let lastError = null;
  const enrichedPrompt = buildPromptWithHistory(prompt, history);

  for (const model of modelCandidates) {
    try {
      const response = await ai.models.generateContent({
        model,
        contents: enrichedPrompt
      });

      return res.json({ reply: extractTextFromResponse(response) });
    } catch (error) {
      lastError = error;
      console.error(`Fallo con modelo ${model}:`, error?.message || error);
    }
  }

  return res.status(500).json({
    error: 'No se pudo completar la solicitud a Gemini.',
    details: lastError?.message || 'Error desconocido'
  });
});

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(port, () => {
  console.log(`Aplicación ejecutándose en http://localhost:${port}`);
});
