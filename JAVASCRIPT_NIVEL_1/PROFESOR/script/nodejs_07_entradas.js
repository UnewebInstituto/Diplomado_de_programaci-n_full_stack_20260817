const readline = require('readline/promises');
const { stdin: input, stdout: output } = require('process');

async function calcularEcuacionCuadratica() {
    // Inicializar la interfaz de lectura y escritura para la consola
    const rl = readline.createInterface({ input, output });

    let continuar = "S";

    try {
        while (continuar === "S") {
            // Lectura de "a" simulando el prompt
            let aStr = await rl.question("Ingrese el valor de a: ");
            let a = parseFloat(aStr);

            if (a === 0) {
                console.log("Error: El valor de 'a' debe ser distinto de 0");
            } else {
                // Lectura de "b"
                let bStr = await rl.question("Ingrese el valor de b: ");
                let b = parseFloat(bStr);

                // Lectura de "c" en una sola línea
                let cStr = await rl.question("Ingrese el valor de c: ");
                let c = parseFloat(cStr);

                // Cálculo del discriminante (subRadical)
                let subRadical = (b * b) - (4 * a * c);

                if (subRadical >= 0) {
                    // Corrección importante de precedencia en los paréntesis del divisor: (2 * a)
                    let x1 = (-b + Math.sqrt(subRadical)) / (2 * a);
                    let x2 = (-b - Math.sqrt(subRadical)) / (2 * a);
                    
                    console.log(`Resultados:\nx1 = ${x1}\nx2 = ${x2}`);
                } else {
                    console.log("Error: Expresión sub radical debe ser mayor o igual a 0");
                }
            }

            // Simulación de la instrucción confirm (S/N)
            let respuesta = await rl.question("¿Desea efectuar un nuevo cálculo? (S/N): ");
            if (respuesta.toUpperCase() === "S") {
                continuar = "S";
            } else {
                continuar = "N";
            }
        }
    } finally {
        // Cierre obligatorio de la interfaz readline al terminar el ciclo
        rl.close();
    }

    console.log("Fin del programa");
}

// Ejecución de la función principal async
calcularEcuacionCuadratica();