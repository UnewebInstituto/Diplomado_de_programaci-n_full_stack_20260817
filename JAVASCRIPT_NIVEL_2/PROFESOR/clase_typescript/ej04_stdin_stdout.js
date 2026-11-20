"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const promises_1 = require("node:readline/promises");
const node_process_1 = require("node:process");
const lector = (0, promises_1.createInterface)({ input: node_process_1.stdin, output: node_process_1.stdout });
function stdout(texto) {
    node_process_1.stdout.write(texto + "\n");
}
async function stdin(pregunta) {
    return (await lector.question(pregunta)).trim();
}
async function main() {
    try {
        const nombre = await stdin("Ingrese su nombre: ");
        const apellido = await stdin("Ingrese su apellido: ");
        stdout(`Nombre: ${nombre}`);
        stdout(`Apellido: ${apellido}`);
    }
    finally {
        lector.close();
    }
}
main();
