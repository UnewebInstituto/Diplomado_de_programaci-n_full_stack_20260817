require('dotenv').config();

const readline = require('readline');
const { GoogleGenAI } = require('@google/genai');

const apiKey = process.env.GEMINI_API_KEY;
const modelName = process.env.GEMINI_MODEL || 'gemini-3.5-flash-lite';

if (!apiKey) {
  console.error('La variable GEMINI_API_KEY no está definida.');
  console.error('En Windows CMD, ejecuta:');
  console.error('set GEMINI_API_KEY="TU_CLAVE_AQUI"');
  console.error('Luego ejecuta: node app.js');
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function askQuestion() {
  rl.question('\nEscribe tu pregunta (o escribe "salir" para terminar): ', async (question) => {
    const cleanQuestion = question.trim();

    if (!cleanQuestion || cleanQuestion.toLowerCase() === 'salir' || cleanQuestion.toLowerCase() === 'exit' || cleanQuestion.toLowerCase() === 'q') {
      console.log('Hasta luego.');
      rl.close();
      return;
    }

    try {
      console.log('\nConsultando a Gemini...\n');

      const response = await ai.models.generateContent({
        model: modelName,
        contents: cleanQuestion,
      });

      const text = response?.text || response?.candidates?.[0]?.content?.parts?.map((part) => part.text).join('') || 'No se obtuvo respuesta.';

      console.log('Respuesta de Gemini:\n');
      console.log(text);
      askQuestion();
    } catch (error) {
      console.error('\nOcurrió un error al consultar Gemini:');
      console.error(error.message || error);
      askQuestion();
    }
  });
}

console.log('=== Gemini CLI ===');
console.log('La API key se está leyendo desde la variable de entorno GEMINI_API_KEY.');
askQuestion();
