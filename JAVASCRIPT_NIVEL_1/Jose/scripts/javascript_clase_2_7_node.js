import readline from 'node:readline/promises';
import { stdin as input, stdout as output } from 'node:process';

async function ecuacionCuadratica() {
  // — Configuración de la interfaz de lectura en consola
  const rl = readline.createInterface({ input, output });
  
  // — Inicializacion de variables
  var a, b, c, x1, x2, subRadical, respuesta, continuar;

  continuar = "S";
  console.log("\nEcuacion Cuadratica\n");

  while (continuar == "S") {
    // — Lectura de "a" usando await
    a = await rl.question("Ingrese el valor de a: ");
    // — "a" string -> float
    a = parseFloat(a);

    if (a == 0) {
      console.log("ERROR: Valor de 'a' no puede ser CERO (0)\n");
    } else {
      // — Lectura de "b" + string -> float
      b = await rl.question("Ingrese el valor de b: ");
      b = parseFloat(b);

      // — Lectura de "c" + string -> float
      c = await rl.question("Ingrese el valor de c: ");
      c = parseFloat(c);

      // — Cálculo del discriminante
      subRadical = b * b - 4 * a * c;

      if (subRadical >= 0) {
        // Corrección de paréntesis en la fórmula cuadrática
        x1 = (-b + Math.sqrt(subRadical)) / (2 * a);
        x2 = (-b - Math.sqrt(subRadical)) / (2 * a);
        console.log(`\nResultados:\nx1 = ${x1}\nx2 = ${x2}\n`);
      } else {
        console.log("ERROR: Expression Sub Radical debe ser mayor o igual a CERO (0)\n");
      }
    }

    // — Reemplazo de confirm() por una pregunta de texto
    respuesta = await rl.question("Desea hacer un nuevo calculo? (S/N): ");
    
    if (respuesta.toUpperCase() === "S") {
      continuar = "S";
    } else {
      continuar = "N";
    }
  }

  // — Importante cerrar la interfaz al terminar
  console.log("Fin del programa");
  rl.close();
}

// Ejecutar la función principal
ecuacionCuadratica();