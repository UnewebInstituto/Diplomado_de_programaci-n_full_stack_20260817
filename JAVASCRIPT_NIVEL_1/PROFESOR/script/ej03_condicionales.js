/**
 * Condicionales Simples
 */
let a = 11;
let b = 10;
if (a < b) {
    console.log(`${a} es menor que ${b}`);
};
console.warn('---');
/**
 * Condicionales Compuestos
 */
if (b < a){
    console.log(`${a} es mayor que ${b}`);
}else{
    console.log(`${a} es menor que ${b}`);
};
console.warn('---');
/**
 * Condicionales múltiples
 */
if (a > b){
    console.log(`${a} es mayor que ${b}`);
}else if (a < b){
    console.log(`${a} es menor que ${b}`);
}else{
    console.log(`${a} es igual que ${b}`);
}
console.warn('---');
/**
 * Selección múltiple
 */
let lenguaje = 'js'
switch (lenguaje) {
    case 'php':
        console.log('Pre Processor Hypertext');
        break;
    case 'py':
        console.log('Python');
        break
    case 'sql':
        console.log('Structured Query Language');
        break
    default:
        console.log('Javascript')
        break;
}
console.warn('---');
/**
 * Operador ternario
 */
(a > b ? console.log(`${a} es mayor que ${b}`) : console.log(`${a} no es mayor que ${b}`));
console.warn('---');
/**
 * Manejo de excepciones
 */
const IVA = 0.16;
try {
    IVA = 0.17
} catch (error) {
    console.error('No se puede actualizar el valor de una constante');
    //console.log(error);
} finally {
    console.warn('Fin de la evaluación de la excepción');
}
