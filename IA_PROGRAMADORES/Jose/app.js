require('dotenv').config();

const { GoogleGenAI } = require('@google/genai');
const readline = require('readline');

const apiKey = process.env.GEMINI_API_KEY;

if (!apiKey) {
  console.error('Error: la variable GEMINI_API_KEY no está definida.');
  console.error('Crea un archivo .env con esta línea: GEMINI_API_KEY=TU_CLAVE_AQUI');
  process.exit(1);
}

const ai = new GoogleGenAI({ apiKey });

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.on('close', () => {
  process.exit(0);
});

process.on('SIGINT', () => {
  rl.close();
});

async function consultarGemini(pregunta) {
  try {
    const response = await ai.models.generateContent({
      model: 'gemini-3.5-flash-lite',
      contents: pregunta,
    });

    const textoRespuesta = response?.text || 'No se obtuvo respuesta del modelo.';
    console.log('\nRespuesta de Gemini:\n');
    console.log(textoRespuesta);
  } catch (error) {
    console.error('\nError al consultar Gemini:');
    console.error(error.message || error);
  }
}

function preguntar() {
  if (rl.closed) return;

  rl.question('\nEscribe tu pregunta (o escribe "salir" para terminar): ', async (entrada) => {
    if (rl.closed) return;

    const pregunta = entrada.trim();

    if (!pregunta) {
      console.log('La pregunta no puede estar vacía.');
      preguntar();
      return;
    }

    if (pregunta.toLowerCase() === 'salir') {
      console.log('Fin de la sesión.');
      rl.close();
      return;
    }

    await consultarGemini(pregunta);

    if (!rl.closed) {
      preguntar();
    }
  });
}

console.log('Bienvenido a la CLI de Gemini con Node.js');
console.log('La clave API está cargada desde el archivo .env');
preguntar();
