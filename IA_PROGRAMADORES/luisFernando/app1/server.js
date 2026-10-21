const express = require('express');
const path = require('path');
const fs = require('fs');
require('dotenv').config({ path: path.join(__dirname, '.env') });
const { GoogleGenAI } = require('@google/genai');

const app = express();
const PORT = process.env.PORT || 4011;
const MODEL_NAME = 'gemini-3.5-flash-lite';
const AUDIT_LOG_PATH = path.join(__dirname, 'auditoria.log');

function registrarEvento({ pregunta, respuesta, ip }) {
  const ahora = new Date();
  const fecha = ahora.toISOString().split('T')[0];
  const hora = ahora.toTimeString().split(' ')[0];
  const linea = `[${fecha} ${hora}] IP: ${ip || 'desconocida'} | Pregunta: ${pregunta.trim()} | Respuesta: ${respuesta || 'Sin respuesta'}\n`;

  fs.appendFileSync(AUDIT_LOG_PATH, linea, 'utf8');
}

if (!process.env.GEMINI_API_KEY) {
  console.error('La variable GEMINI_API_KEY no está definida en .env');
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

app.use(express.json({ limit: '1mb' }));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/health', (req, res) => {
  res.json({ ok: true, message: 'Servidor funcionando correctamente' });
});

app.post('/api/chat', async (req, res) => {
  const prompt = req.body?.prompt;
  const ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress || 'desconocida';

  if (!prompt || !prompt.trim()) {
    return res.status(400).json({ error: 'Debes enviar un prompt válido.' });
  }

  try {
    const response = await ai.models.generateContent({
      model: MODEL_NAME,
      contents: prompt.trim(),
    });

    let answer = 'No se obtuvo respuesta del modelo.';

    if (typeof response?.text === 'string' && response.text.trim()) {
      answer = response.text;
    } else if (Array.isArray(response?.candidates)) {
      const firstCandidate = response.candidates[0];
      const parts = firstCandidate?.content?.parts || [];
      answer = parts.map((part) => part.text || '').join('') || answer;
    }

    registrarEvento({
      pregunta: prompt.trim(),
      respuesta: answer,
      ip,
    });

    res.json({ answer });
  } catch (error) {
    console.error('Error al consultar Gemini:', error);
    registrarEvento({
      pregunta: prompt.trim(),
      respuesta: `ERROR: ${error.message}`,
      ip,
    });

    res.status(500).json({
      error: 'No se pudo procesar la solicitud con Gemini.',
    });
  }
});

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
