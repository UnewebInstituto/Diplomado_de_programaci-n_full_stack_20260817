import "dotenv/config";
import { GoogleGenAI } from "@google/genai";
import readline from "node:readline/promises";
import { stdin as input, stdout as output } from "node:process";

const apiKey = process.env.GEMINI_API_KEY;

if (!apiKey) {
  console.error("Error: la variable GEMINI_API_KEY no está definida.");
  console.error("Ejecuta el programa así en CMD:");
  console.error("set GEMINI_API_KEY=TU_CLAVE_AQUI");
  console.error("node app.js");
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });
const rl = readline.createInterface({ input, output });

console.log("=== Consultas a Gemini ===");
console.log("Escribe tu pregunta. Para salir escribe: salir");

let keepAsking = true;

while (keepAsking) {
  const question = (await rl.question("Pregunta> ")).trim();

  if (!question) {
    continue;
  }

  const lowerQuestion = question.toLowerCase();

  if (lowerQuestion === "salir" || lowerQuestion === "exit" || lowerQuestion === "q") {
    console.log("Hasta luego.");
    keepAsking = false;
    break;
  }

  try {
    const response = await ai.models.generateContent({
      model: "gemini-3.5-flash-lite",
      contents: question,
    });

    const text =
      response?.text ??
      response?.candidates?.[0]?.content?.parts
        ?.map((part) => part.text ?? "")
        .join("") ??
      "No se obtuvo una respuesta válida.";

    console.log("\nRespuesta:\n");
    console.log(text);
    console.log("\n");
  } catch (error) {
    console.error("Ocurrió un error al consultar Gemini:");
    console.error(error?.message ?? error);
    keepAsking = false;
  }
}

rl.close();
