/*
    Condicionales Simples
*/
let a = 10;
let b = 11;
if (a < b) {
    console.log(`${a} es menor que ${b}`)
};
console.warn('---');

/*
    Condicionales Compuestos
*/
if (b > a){
    console.log(`${a} es mayor que ${b}`);
    }else{
    console.log(`${a} es menor que ${b}`);
};
console.warn('---');

/*
    Condicionales Multiples
*/
if (a > b) {
    console.log(`${a} es mayor que ${b}`);
    }else if (a < b){
    console.log(`${a} es menor que ${b}`);
    }else{
    console.log(`${a} es igual que ${b}`);
};
console.warn('---');

/*
    Seleccion multiple
*/
let lenguaje = 'js'
switch (lenguaje) {
    case 'php':
        console.log('Pre Hypertext Processor\n');
        break;
    case 'py':
        console.log('Python\n');
        break;
    case 'sql':
        console.log('Structure Query Language\n');
        break;
    default:
        console.log('JavaScript\n');
        break;
};
console.warn('---');
/*
    Operador ternario
*/

(a > b) ? console.log(`${a} es mayor que ${b}`) : console.log(`${a} no es mayor que ${b}`);
console.warn('---');

/*
    Manejo de excepciones
*/
const IVA = 0.16;
try {
    IVA = 0.17
} catch (error) {
    console.error('No se puede cambiar una constante')
    console.log(error);
} finally {
    console.warn('Fin de la evaluacion de la excepcion')
}