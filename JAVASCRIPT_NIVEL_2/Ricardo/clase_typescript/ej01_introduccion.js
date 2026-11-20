"use strict";
let helloWorld = "Hello World";
helloWorld = "Hello World";
/* La declaración de objetos de tipo User es posible, ya que cumple con la interface definida.
*/
const user = {
    name: 'Ana Vasquez',
    id: 0,
};
console.log(typeof (user));
console.log(typeof (user.name));
console.log("Usuario: " + user.name);
console.log(typeof (user.id));
console.log("Id: " + user.id);
// Declaración de clase 
class UserAccount {
    // atributos de la clase
    nombre;
    apellido;
    edad;
    sexo;
    id;
    // constructor de la clase
    constructor(nombre, apellido, edad, sexo, id) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.sexo = sexo;
        this.id = id;
    }
}
// Instancia de la clase o creación de un objeto de la clase UserAccount
const userAccount1 = new UserAccount('Ana', 'Vasquez', 30, 'Femenino', 0);
const userAccount2 = new UserAccount('Yolanda', 'Tortoza', 45, 'Femenino', 1);
const userAccount3 = new UserAccount('Nelly', 'Contreras', 58, 'Femenino', 2);
// Instancia de la clase o creación de un objeto de la clase
//  UserAccount, pero con el tipo Alumno (interface)
const userAccount4 = new UserAccount('Libia', 'Cols', 45, 'Femenino', 3);
/**
 * Acceder al contenido de cada objeto
 */
console.log("Usuario 1: " + userAccount1.nombre + " " + userAccount1.apellido + " Edad: " + userAccount1.edad + " Sexo: " + userAccount1.sexo + " Id: " + userAccount1.id);
console.log("Usuario 2: " + userAccount2.nombre + " " + userAccount2.apellido + " Edad: " + userAccount2.edad + " Sexo: " + userAccount2.sexo + " Id: " + userAccount2.id);
console.log("Usuario 3: " + userAccount3.nombre + " " + userAccount3.apellido + " Edad: " + userAccount3.edad + " Sexo: " + userAccount3.sexo + " Id: " + userAccount3.id);
console.log("Usuario 4: " + userAccount4.nombre + " " + userAccount4.apellido + " Edad: " + userAccount4.edad + " Sexo: " + userAccount4.sexo + " Id: " + userAccount4.id);
let myBoolean = true;
console.log("Tipo de dato MyBoolean: " + typeof (myBoolean));
let ventana;
ventana = "open";
console.log("Estado de la ventana: " + ventana);
ventana = "closed";
console.log("Estado de la ventana: " + ventana);
ventana = "minimized";
console.log("Estado de la ventana: " + ventana);
//ventana = "cerrado"; // Esto generará un error, ya que "cerrado" no es un valor permitido para el tipo WindowStates
// Declaración de una función que recibe
//  un parámetro de tipo string o string[]
//  y devuelve la longitud del mismo
function getLength(obj) {
    return obj.length;
}
console.log(getLength("Hola")); // Devuelve 4
console.log(getLength(["Hola", "Mundo"])); // Devuelve 2
function wrapInArray(obj) {
    if (typeof obj === "string") {
        return [obj];
    }
    return obj;
}
console.log(wrapInArray("Hola")); // Devuelve ["Hola"]
console.log(wrapInArray(["Hola", "Mundo"])); // Devuelve ["Hola", "Mundo"]
let stringArray = ["Hola", "Mundo"];
let numberArray = [1, 2, 3];
let objectWithNameArray = [{ name: "Ana" }, { name: "Yolanda" }, { name: "Nelly" }, { name: "Libia" }];
// Recorrido de los arrays
console.log("Recorrido del array de strings:");
let i = 0;
while (i < stringArray.length) {
    console.log(stringArray[i]);
    i++;
}
console.log("Recorrido del array de números:");
i = 0;
do {
    console.log(numberArray[i]);
    i++;
} while (i < numberArray.length);
console.log("Recorrido del array de objetos con propiedad name:");
for (let i = 0; i < objectWithNameArray.length; i++) {
    console.log(objectWithNameArray[i].name);
}
// Otra forma de recorrer el array de objetos con propiedad name
console.log("Recorrido del array de objetos con propiedad name (for...of):");
for (const obj of objectWithNameArray) {
    console.log(obj.name);
}
