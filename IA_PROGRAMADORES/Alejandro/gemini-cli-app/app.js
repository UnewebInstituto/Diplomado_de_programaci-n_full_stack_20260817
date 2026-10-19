import "dotenv/config";
import { GoogleGenAI } from "@google/genai";
import readline from "readline";

const apiKey = process.env.GEMINI_API_KEY;

if (!apiKey) {
  console.error("❌ Error: la variable de entorno GEMINI_API_KEY no está definida.");
  console.error("Asegúrate de crear el archivo .env con esta línea:");
  console.error("  GEMINI_API_KEY=TU_API_KEY");
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

async function consultarGemini(pregunta) {
  try {
    const respuesta = await ai.models.generateContent({
      model: "models/gemini-3.5-flash-lite",
      contents: pregunta,
    });

    return respuesta.text || "No se obtuvo respuesta.";
  } catch (error) {
    console.error("❌ Error al consultar Gemini:", error.message);
    return null;
  }
}

async function main() {
  console.log("🤖 Asistente Gemini en Node.js");
  console.log("Escribe 'salir' para terminar.\n");

  while (true) {
    const pregunta = await new Promise((resolve) => {
      rl.question("¿Qué deseas preguntar? ", (answer) => resolve(answer));
    });

    if (pregunta.trim().toLowerCase() === "salir") {
      console.log("Hasta luego.");
      rl.close();
      break;
    }

    const respuesta = await consultarGemini(pregunta);

    if (respuesta) {
      console.log("\nRespuesta:");
      console.log(respuesta);
      console.log("");
    }
  }
}

main();
