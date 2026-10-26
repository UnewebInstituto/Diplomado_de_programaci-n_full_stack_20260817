// Mientras
console.warn('Ejecución ciclo Mientras');
let i = 0;
while (i < 5){
    console.log(i);
    i = i + 1;
}
console.warn('Fin de la ejecución del ciclo Mientras');
console.log('\n');

// Repetir
console.warn('Ejecución ciclo Repetir');
i = 0;
do{
    console.log(i);
    i = i + 1;
}while (i < 5);

console.warn('Fin de la ejecución del ciclo Repetir');
console.log('\n');

console.warn('Ejecución ciclo Para');
for (i = 0; i < 5; i++) {
    console.log(i);
}
console.warn('Fin de la ejecución del ciclo Para');
console.log('\n');