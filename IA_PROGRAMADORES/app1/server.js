const express = require('express');
const fs = require('fs');
const path = require('path');
const dotenv = require('dotenv');
const cors = require('cors');
const { GoogleGenAI } = require('@google/genai');

dotenv.config({ path: path.join(__dirname, '.env') });

const app = express();
const port = process.env.PORT || 3001;
const MAX_RETRIES = 3;
const logFilePath = path.join(__dirname, 'auditoria.log');

function logAuditQuestion(prompt) {
  const now = new Date();
  const fecha = now.toISOString().split('T')[0];
  const hora = now.toTimeString().split(' ')[0];
  const entry = `${fecha} ${hora} - ${prompt.trim()}\n`;

  fs.appendFileSync(logFilePath, entry, 'utf8');
}

function isRetryableGeminiError(error) {
  const status = error?.status || error?.code || error?.response?.status;
  const message = error?.message || '';

  return (
    status === 429 ||
    status === 500 ||
    status === 503 ||
    /429|500|503|too many requests|rate limit|temporar|unavailable/i.test(message)
  );
}

async function generateWithRetry({ apiKey, prompt }) {
  const ai = new GoogleGenAI({ apiKey });

  for (let attempt = 0; attempt <= MAX_RETRIES; attempt += 1) {
    try {
      return await ai.models.generateContent({
        model: 'gemini-3.5-flash-lite',
        contents: prompt
      });
    } catch (error) {
      const isRetryable = isRetryableGeminiError(error);

      if (!isRetryable || attempt === MAX_RETRIES) {
        throw error;
      }

      const delayMs = 1000 * (attempt + 1) * 2;
      console.warn(`Gemini temporal error (${error?.status || 'unknown'}). Reintentando en ${delayMs}ms...`);
      await new Promise((resolve) => setTimeout(resolve, delayMs));
    }
  }
}

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/health', (req, res) => {
  res.json({
    status: 'ok',
    message: 'La API de Gemini está funcionando correctamente.'
  });
});

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.post('/api/generate', async (req, res) => {
  const { prompt } = req.body;

  if (!prompt || !prompt.trim()) {
    return res.status(400).json({
      error: 'Debes enviar un texto para consultar a Gemini.'
    });
  }

  const apiKey = process.env.GEMINI_API_KEY;

  if (!apiKey) {
    return res.status(500).json({
      error: 'La variable GEMINI_API_KEY no está configurada.'
    });
  }

  try {
    logAuditQuestion(prompt);

    const response = await generateWithRetry({ apiKey, prompt });

    const text =
      response?.text ||
      response?.candidates?.[0]?.content?.parts
        ?.map((part) => part.text || '')
        .join('') ||
      'No se obtuvo respuesta.';

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
