import { createInterface } from "node:readline/promises";
import { stdin as entrada, stdout as salida } from "node:process";

const lector = createInterface({ input: entrada, output: salida });

function stdout(texto: string): void {
  salida.write(texto + "\n");
}

async function stdin(pregunta: string): Promise<string> {
  return (await lector.question(pregunta)).trim();
}

async function main(): Promise<void> {
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