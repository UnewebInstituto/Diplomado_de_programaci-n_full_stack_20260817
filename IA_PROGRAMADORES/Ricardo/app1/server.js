const express = require("express");
const fs = require("fs");
const path = require("path");
require("dotenv").config();
const { GoogleGenAI } = require("@google/genai");

const app = express();
const auditLogPath = path.join(__dirname, "auditoria.log");
const PORT = 3013;
const apiKey = process.env.GEMINI_API_KEY;

if (!apiKey) {
  console.error("La variable GEMINI_API_KEY no está definida.");
  console.error("Crea un archivo .env dentro de esta carpeta con:");
  console.error("GEMINI_API_KEY=TU_API_KEY");
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });

function extractTextFromResponse(response) {
  if (!response) return "No se generó una respuesta.";

  if (typeof response.text === "string" && response.text.trim()) {
    return response.text;
  }

  const parts = response?.candidates?.[0]?.content?.parts;
  if (Array.isArray(parts)) {
    const text = parts
      .map((part) => part?.text)
      .filter(Boolean)
      .join("");

    if (text) return text;
  }

  return "No se generó una respuesta.";
}

function registrarAuditoria(pregunta) {
  const now = new Date();
  const fecha = now.toISOString().split("T")[0];
  const hora = now.toTimeString().split(" ")[0];
  const linea = `${fecha} ${hora} - ${pregunta}\n`;

  fs.appendFileSync(auditLogPath, linea, "utf8");
}

app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

app.get("/api/health", (req, res) => {
  res.json({ ok: true, message: "Servidor activo" });
});

app.post("/api/generate", async (req, res) => {
  const prompt = req.body?.prompt?.trim();

  if (!prompt) {
    return res.status(400).json({ error: "Debes enviar un prompt válido." });
  }

  registrarAuditoria(prompt);

  try {
    const response = await ai.models.generateContent({
      model: "gemini-2.5-flash",
      contents: [
        {
          role: "user",
          parts: [{ text: prompt }],
        },
      ],
    });

    const answer = extractTextFromResponse(response);
    return res.json({ answer });
  } catch (error) {
    console.error("Error al consultar Gemini:", error?.message || error);
    console.error("Status:", error?.status || "no disponible");
    return res.status(500).json({
      error: "No se pudo completar la solicitud a Gemini.",
      details: error?.message || "Error desconocido",
    });
  }
});

app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.listen(PORT, () => {
  console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
  console.log(`Directorio actual: ${__dirname}`);
});
