// Node.js no incluye prompt(), alert() ni confirm(), que pertenecen al navegador.
// readline/promises permite solicitar texto desde la consola usando async/await.
const readline = require("node:readline/promises");
const { stdin: entrada, stdout: salida } = require("node:process");

// La función principal es asíncrona porque cada pregunta espera una respuesta.
async function calcularEcuacionCuadratica() {
    // Crea la conexión entre la entrada y la salida estándar de la consola.
    const consola = readline.createInterface({
        input: entrada,
        output: salida
    });

    // La respuesta afirmativa inicial permite ejecutar el ciclo al menos una vez.
    let continuar = true;

    try {
        // Repite el cálculo mientras el usuario responda que desea continuar.
        while (continuar) {
            // rl.question() recibe texto de la consola; equivale a prompt().
            const textoA = await consola.question("Ingrese el valor de a: ");
            const a = Number.parseFloat(textoA);

            // El coeficiente a no puede ser cero en una ecuación cuadrática.
            if (!Number.isFinite(a)) {
                console.log("Error: ingrese un número válido para 'a'.");
            } else if (a === 0) {
                console.log("Error: el valor de 'a' debe ser distinto de 0.");
            } else {
                // Se leen y convierten los otros coeficientes de texto a números.
                const textoB = await consola.question("Ingrese el valor de b: ");
                const b = Number.parseFloat(textoB);
                const textoC = await consola.question("Ingrese el valor de c: ");
                const c = Number.parseFloat(textoC);

                // Evita calcular con entradas que no sean números válidos.
                if (!Number.isFinite(b) || !Number.isFinite(c)) {
                    console.log("Error: ingrese números válidos para 'b' y 'c'.");
                } else {
                    // El discriminante determina si existen raíces reales.
                    const subRadical = (b * b) - (4 * a * c);

                    if (subRadical >= 0) {
                        // La fórmula cuadrática divide por 2*a, no por 2 y luego por a.
                        const x1 = (-b + Math.sqrt(subRadical)) / (2 * a);
                        const x2 = (-b - Math.sqrt(subRadical)) / (2 * a);

                        // console.log() muestra el resultado; cumple el papel de alert().
                        console.log(`Resultados:\nx1 = ${x1}\nx2 = ${x2}`);
                    } else {
                        console.log(
                            "Error: la expresión subradical debe ser mayor o igual a 0."
                        );
                    }
                }
            }

            // Esta pregunta de texto reemplaza confirm(); se aceptan S/s para continuar.
            const respuesta = await consola.question(
                "¿Desea efectuar un nuevo cálculo? (S/N): "
            );
            continuar = respuesta.trim().toUpperCase() === "S";
        }
    } finally {
        // Cierra la interfaz aunque ocurra un error durante la lectura.
        consola.close();
    }

    // Mensaje final equivalente al alert() final del programa original.
    console.log("Fin del programa");
}

// Inicia el programa; la función administra internamente las lecturas asíncronas.
calcularEcuacionCuadratica();
