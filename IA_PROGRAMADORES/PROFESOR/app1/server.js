const express = require('express');
const path = require('path');
const fs = require('fs');
const dotenv = require('dotenv');
const { GoogleGenAI } = require('@google/genai');

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;
const logFilePath = path.join(__dirname, 'auditoria.log');

function registrarPregunta(pregunta) {
  const ahora = new Date();
  const fecha = ahora.toISOString().split('T')[0];
  const hora = ahora.toLocaleTimeString('es-ES', { hour12: false });
  const linea = `[${fecha}] [${hora}] ${pregunta.trim()}\n`;

  fs.appendFileSync(logFilePath, linea, 'utf8');
}

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.post('/api/generate', async (req, res) => {
  const { prompt } = req.body;

  if (!prompt || !prompt.trim()) {
    return res.status(400).json({ error: 'Debes enviar un texto para consultar a Gemini.' });
  }

  const apiKey = process.env.GEMINI_API_KEY;

  registrarPregunta(prompt);

  if (!apiKey) {
    return res.status(500).json({ error: 'La variable GEMINI_API_KEY no está configurada.' });
  }

  try {
    const ai = new GoogleGenAI({ apiKey });

    const response = await ai.models.generateContent({
      model: 'gemini-3.5-flash-lite',
      contents: prompt
    });

    const text = response?.text || response?.candidates?.[0]?.content?.parts?.map((part) => part.text || '').join('') || 'No se obtuvo respuesta.';

    return res.json({ result: text.trim() });
  } catch (error) {
    console.error('Error al consultar Gemini:', error);
    return res.status(500).json({
      error: 'No se pudo completar la consulta con Gemini.',
      detail: error?.message || 'Error desconocido'
    });
  }
});

app.listen(port, () => {
  console.log(`Servidor funcionando en http://localhost:${port}`);
});
