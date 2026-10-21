import express from 'express';
import dotenv from 'dotenv';
import path from 'path';
import fs from 'node:fs/promises';
import { fileURLToPath } from 'url';
import { GoogleGenAI } from '@google/genai';

dotenv.config();

const app = express();
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const port = Number(process.env.PORT) || 3000;
const apiKey = process.env.GEMINI_API_KEY;
const auditFilePath = path.join(__dirname, 'auditoria', 'chat-audit.log');

async function registrarAuditoria(prompt) {
  const timestamp = new Date().toISOString();
  const cleanPrompt = String(prompt).replace(/\r?\n/g, ' ').trim();

  await fs.mkdir(path.dirname(auditFilePath), { recursive: true });
  await fs.appendFile(auditFilePath, `[${timestamp}] ${cleanPrompt}\n`, 'utf8');
}

if (!apiKey) {
  console.error('Falta GEMINI_API_KEY en el archivo .env');
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/health', (req, res) => {
  res.json({ ok: true, message: 'API funcionando correctamente' });
});

app.post('/api/chat', async (req, res) => {
  const prompt = req.body?.prompt?.trim();

  if (!prompt) {
    return res.status(400).json({ error: 'Debes enviar un prompt válido.' });
  }

  try {
    await registrarAuditoria(prompt);

    const response = await ai.models.generateContent({
      model: 'gemini-3.5-flash-lite',
      contents: prompt,
    });

    const text =
      response?.text ||
      response?.candidates?.[0]?.content?.parts
        ?.map((part) => part?.text || '')
        .join('') ||
      'No se obtuvo respuesta del modelo.';

    return res.json({ text });
  } catch (error) {
    console.error('Error al consultar Gemini:', error);
    return res.status(500).json({
      error: 'No se pudo completar la solicitud con Gemini.',
    });
  }
});

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(port, () => {
  console.log(`Servidor en http://localhost:${port}`);
});
