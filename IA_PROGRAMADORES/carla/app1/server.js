const express = require('express');
const fs = require('fs');
const path = require('path');
const dotenv = require('dotenv');
const { GoogleGenAI } = require('@google/genai');

dotenv.config({ path: path.join(__dirname, '.env') });

const logPath = path.join(__dirname, 'auditoria.log');

function registrarPregunta(prompt) {
  const now = new Date();
  const fecha = now.toISOString().slice(0, 10);
  const hora = now.toTimeString().split(' ')[0];
  const linea = `Fecha: ${fecha} | Hora: ${hora} | Pregunta: ${prompt}\n`;
  fs.appendFileSync(logPath, linea, 'utf8');
}

const app = express();
const PORT = process.env.PORT || 3000;
const apiKey = process.env.GEMINI_API_KEY;

if (!apiKey) {
  console.error('Error: GEMINI_API_KEY no está definida en el archivo .env');
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/health', (req, res) => {
  res.json({ ok: true, message: 'Servidor funcionando correctamente.' });
});

app.post('/api/chat', async (req, res) => {
  try {
    const prompt = req.body?.prompt?.trim();

    if (!prompt) {
      return res.status(400).json({ error: 'Debes enviar un texto en el campo prompt.' });
    }

    registrarPregunta(prompt);

    const model = process.env.GEMINI_MODEL || 'gemini-3.5-flash-lite';
    const response = await ai.models.generateContent({
      model,
      contents: prompt,
    });

    const answer = response?.text || response?.output_text || 'No hubo respuesta del modelo.';

    return res.json({ answer });
  } catch (error) {
    console.error('Error al consultar Gemini:', error);
    return res.status(500).json({
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
