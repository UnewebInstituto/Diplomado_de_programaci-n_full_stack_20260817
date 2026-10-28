/*
    3 Tipos de declaraciones
    var     —   Variables globales
    let     —   Variables locales
    const   —   Constantes (que deben ir en mayuscula)

    Toda declaracion de variable asume el tipo de dato con el cual sea inicializada
*/
var nombre, edad, estatura, estudiante;
/*
    Mientraas no se inicialice, el tipo de dato que aplica para la declaracion var, es undefined
*/
console.log('Tipos de variables');
console.log('nombre:', typeof(nombre));
console.log('edad:', typeof(edad));
console.log('estatura:', typeof(estatura));
console.log('estudiante:', typeof(estudiante));

/*
    Inicializacion de variables
*/
nombre = 'test';
edad = 12;
estatura = 21.1;
estudiante = true;
console.log('Tipos de variables despues de la inicializacion');
console.log('nombre:', typeof(nombre));
console.log('edad:', typeof(edad));
console.log('estatura:', typeof(estatura));
console.log('estudiante:', typeof(estudiante));

/* 
    Declaracion de constantes
*/
const PI = 3.1416;
const IVA = 0.16;
console.log('Valor constante PI: ', PI);
console.log('Valor constante IVA: ', IVA);

/* 
    Las constantes no se pueden cambiar; da error
*/
// IVA = 0.17;

/*
    Caso "let", para declaraciones de variables privadas
*/
var variablePrivada = 'Valor Global';
function evaluar(){
    let variablePrivada = 'Valor Privado';
    console.log('Valor variable privada');
    console.log(variablePrivada);
    variablePrivada = 'Nuevo valor privado';
    console.log(variablePrivada);
}
console.log('Valor variable global o publica:');
console.log(variablePrivada);
evaluar();
console.log(variablePrivada);