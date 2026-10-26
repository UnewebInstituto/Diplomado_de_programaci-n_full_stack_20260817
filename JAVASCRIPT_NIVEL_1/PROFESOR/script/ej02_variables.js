/**
 * Hay 3 tipos de declaraciones
 * var   : variables globales
 * let   : variables locales
 * const : constantes (deben ir en mayúscula)
 * 
 * Toda declaración de variable 
 * asume el tipo de dato con el cual
 * sea inicializada
 */
var nombre, edad, estatura, estudiante;
/**
 * Mientras no se hay inicializado, el tipo de dato
 * que aplica para la declaración var, es undefined
 */
console.log('Tipos de variables');
console.log('nombre:', typeof(nombre));
console.log('edad:', typeof(edad));
console.log('estatura:', typeof(estatura));
console.log('estudiante:', typeof(estudiante));
/**
 * Inicialización de variables
 */
nombre = 'HENRY';
edad = 57;
estatura = 1.71;
estudiante = true;
console.log('Tipos de variables después de inicializar');
console.log('nombre:', typeof(nombre));
console.log('edad:', typeof(edad));
console.log('estatura:', typeof(estatura));
console.log('estudiante:', typeof(estudiante));
/**
 * Declaración de constantes
 */
const PI = 3.1416;
const IVA = 0.16;
console.log('Valor constante PI:',PI);
console.log('Valor constante IVA:',IVA);
/**
 * Se intenta actualizar el valor de la constante
 * y esto va a generar un error
 */
// IVA = 0.17;
/**
 * Caso let, para declaración de variables
 * privadas
 */
var variablePrivada = 'Valor Global';
function evaluar(){
    let variablePrivada = 'Valor Privado';
    console.log('Valor variable privada:');
    console.log(variablePrivada);
    variablePrivada = 'Nuevo valor Privado';
    console.log(variablePrivada);
}
console.log('Valor variable global o pública:');
console.log(variablePrivada);
evaluar();
console.log(variablePrivada);
