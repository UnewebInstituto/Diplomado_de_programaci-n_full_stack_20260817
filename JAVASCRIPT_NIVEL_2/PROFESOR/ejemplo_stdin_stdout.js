const readline = require("readline");

const lector = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function stdout(texto) {
  process.stdout.write(`${texto}\n`);
}

function stdin(pregunta) {
  return new Promise((resolver) => {
    lector.question(pregunta, (respuesta) => resolver(respuesta.trim()));
  });
}

async function main() {
  try {
    const nombre = await stdin("Ingrese su nombre: ");
    const apellido = await stdin("Ingrese su apellido: ");

    stdout(`Nombre: ${nombre}`);
    stdout(`Apellido: ${apellido}`);
  } finally {
    lector.close();
  }
}

main();