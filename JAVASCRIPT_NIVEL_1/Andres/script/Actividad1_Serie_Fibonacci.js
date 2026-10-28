// Actividad 1 Serie Fibonacci
console.log("Serie Fibonacci:");
function fibonacci(n) {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

// Imprimir los primeros 10 números de la serie
for (let i = 0; i < 10; i++) {
    console.log(fibonacci(i));
}