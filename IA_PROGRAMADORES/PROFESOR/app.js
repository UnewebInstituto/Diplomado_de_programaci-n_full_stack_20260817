const readline = require('node:readline/promises');
const { stdin: input, stdout: output } = require('node:process');
const { GoogleGenAI } = require('@google/genai');

const apiKey = process.env.GEMINI_API_KEY;

if (!apiKey) {
  console.error('Error: la variable de entorno GEMINI_API_KEY no está definida.');
  console.error('En Windows CMD ejecuta: set GEMINI_API_KEY="TU_API_KEY"');
  console.error('Luego inicia la app: node app.js');
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });

async function askGemini(question) {
  const response = await ai.models.generateContent({
    model: 'gemini-3.5-flash-lite',
    contents: question,
  });

  return response.text;
}

async function main() {
  const rl = readline.createInterface({ input, output });

  console.log('=== Chat con Gemini ===');
  console.log('Escribe una pregunta o "salir" para terminar.');

  while (true) {
    const question = (await rl.question('Pregunta: ')).trim();

    if (!question) {
      console.log('Debes ingresar una pregunta.');
      continue;
    }

    const normalized = question.toLowerCase();
    if (normalized === 'salir' || normalized === 'exit' || normalized === 'q') {
      console.log('Hasta luego.');
      break;
    }

    try {
      console.log('\nProcesando tu consulta...\n');
      const answer = await askGemini(question);
      console.log('Respuesta:\n');
      console.log(answer);
      console.log('\n----------------------------------------\n');
    } catch (error) {
      console.error('Error al consultar Gemini:', error.message);
      console.error('Revisa que la API key sea válida y que el modelo esté disponible.');
    }
  }

  rl.close();
}

main().catch((error) => {
  console.error('Error general:', error.message);
  process.exit(1);
});
