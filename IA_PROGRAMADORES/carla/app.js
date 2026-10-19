const readline = require("readline");
const dotenv = require("dotenv");
const { GoogleGenAI } = require("@google/genai");

dotenv.config();

const apiKey = process.env.GEMINI_API_KEY;
const modelCandidates = [
  process.env.GEMINI_MODEL || "gemini-3.5-flash",
  "gemini-3.5-flash-lite",
  "gemini-3.8-flash",
];

if (!apiKey || apiKey === "TU_API_KEY_AQUI") {
  console.log("No hay una GEMINI_API_KEY configurada.");
  console.log("Crea un archivo .env con este contenido:");
  console.log("GEMINI_API_KEY=TU_API_KEY_AQUI");
  console.log("GEMINI_MODEL=gemini-2.0-flash");
  console.log("\nO define la variable al ejecutar:");
  console.log("$env:GEMINI_API_KEY='TU_API_KEY' ; node app.js");
  process.exit(0);
}

const ai = new GoogleGenAI({ apiKey });
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function askQuestion(questionText) {
  return new Promise((resolve) => {
    rl.question(questionText, (answer) => resolve(answer));
  });
}

async function askGemini(question) {
  let lastError = null;

  for (const model of modelCandidates) {
    try {
      const response = await ai.models.generateContent({
        model,
        contents: question,
      });

      return response.text || "No hubo respuesta del modelo.";
    } catch (error) {
      lastError = error;
      console.log(`Intento fallido con el modelo: ${model}`);
    }
  }

  throw lastError || new Error("No fue posible obtener respuesta del modelo.");
}

async function main() {
  console.log("=== Chat con Gemini ===");
  console.log("Escribe 'salir' para terminar.\n");

  while (true) {
    const question = await askQuestion("Tu pregunta: ");
    const normalized = question.trim();

    if (!normalized) {
      console.log("Debes ingresar una pregunta válida.\n");
      continue;
    }

    if (normalized.toLowerCase() === "salir" || normalized.toLowerCase() === "exit") {
      console.log("Hasta luego.");
      break;
    }

    try {
      console.log("\nRespuesta:\n");
      const answer = await askGemini(normalized);
      console.log(answer);
      console.log("\n----------------------------------------\n");
    } catch (error) {
      console.error("Error al consultar Gemini:", error.message || error);
      console.log("Verifica la GEMINI_API_KEY o la conexión a internet.\n");
    }
  }

  rl.close();
}

main().catch((error) => {
  console.error("Error general:", error.message || error);
  rl.close();
  process.exit(1);
});
