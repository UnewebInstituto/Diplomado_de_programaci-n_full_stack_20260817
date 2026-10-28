function generarFibonacci(primerNumero, segundoNumero, cantidad) {
    if (!Number.isFinite(primerNumero) || !Number.isFinite(segundoNumero)) {
        throw new TypeError("Los dos números iniciales deben ser válidos.");
    }

    if (!Number.isInteger(cantidad) || cantidad < 0) {
        throw new RangeError("La cantidad debe ser un entero mayor o igual que cero.");
    }

    const serie = [primerNumero, segundoNumero];

    for (let indice = 2; indice < cantidad; indice++) {
        serie.push(serie[indice - 1] + serie[indice - 2]);
    }

    return serie;
}

function solicitarNumero(mensaje) {
    while (true) {
        const texto = prompt(mensaje);

        if (texto === null) {
            return null;
        }

        const numero = Number(texto);

        if (texto.trim() !== "" && Number.isFinite(numero)) {
            return numero;
        }

        alert("Debes escribir un número válido.");
    }
}

const primerNumero = solicitarNumero("Escribe el primer número de la serie:");

if (primerNumero === null) {
    console.log("La serie no fue generada.");
} else {
    const segundoNumero = solicitarNumero("Escribe el segundo número de la serie:");

    if (segundoNumero === null) {
        console.log("La serie no fue generada.");
    } else {
        const cantidadTerminos = 20;
        console.log("Serie Fibonacci:", generarFibonacci(primerNumero, segundoNumero, cantidadTerminos));
    }
}
