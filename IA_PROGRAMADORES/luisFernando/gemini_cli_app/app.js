import { GoogleGenAI } from "@google/genai";
import readline from "node:readline/promises";
import { stdin as input, stdout as output } from "node:process";

const apiKey = process.env.GEMINI_API_KEY;

if (!apiKey) {
  console.error("❌ La variable GEMINI_API_KEY no está definida.");
  console.error("Define la clave antes de ejecutar:");
  console.error("  set GEMINI_API_KEY=tu_clave_aqui");
  console.error("  node app.js");
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });
const rl = readline.createInterface({ input, output });
let inputClosed = false;

rl.on("close", () => {
  inputClosed = true;
});

console.log("=== Chat con Gemini ===");
console.log("Escribe una pregunta. Escribe 'salir' para terminar.\n");

while (true) {
  if (inputClosed || rl.closed) {
    break;
  }

  let question;

  try {
    question = (await rl.question("Pregunta: ")).trim();
  } catch (error) {
    break;
  }

  if (!question) {
    console.log("Debes escribir una pregunta.");
    continue;
  }

  if (question.toLowerCase() === "salir" || question.toLowerCase() === "exit") {
    console.log("Hasta luego.");
    rl.close();
    break;
  }

  try {
    const response = await ai.models.generateContent({
      model: "gemini-3.5-flash-lite",
      contents: question,
    });

    const text =
      response.text ??
      response.candidates?.[0]?.content?.parts
        ?.map((part) => part.text ?? "")
        .join("") ??
      "No se obtuvo respuesta.";

    console.log("\nRespuesta:\n");
    console.log(text);
    console.log("\n");
  } catch (error) {
    const message = error?.message || String(error);
    console.error("Error al consultar Gemini:");
    console.error(message);

    if (
      message.includes("fetch failed") ||
      message.includes("ECONNRESET") ||
      message.includes("ENOTFOUND") ||
      message.includes("ETIMEDOUT") ||
      message.includes("503")
    ) {
      console.error("La red falló al contactar a Gemini. Verifica tu conexión e inténtalo de nuevo.");
    }
  }
}
