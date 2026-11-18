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
/**
 *
Esta declaración no es posible, ya que el objeto user1 no cumple con la interface User, ya que la propiedad nombre no coincide con la propiedad name definida en la interface.

const user1: User ={
    nombre:'Juan Perez',
    id:1,
}
*/
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
/**
 * Acceder al contenido de cada objeto
 */
console.log("Usuario 1: " + userAccount1.nombre + " " + userAccount1.apellido + " Edad: " + userAccount1.edad + " Sexo: " + userAccount1.sexo + " Id: " + userAccount1.id);
console.log("Usuario 2: " + userAccount2.nombre + " " + userAccount2.apellido + " Edad: " + userAccount2.edad + " Sexo: " + userAccount2.sexo + " Id: " + userAccount2.id);
console.log("Usuario 3: " + userAccount3.nombre + " " + userAccount3.apellido + " Edad: " + userAccount3.edad + " Sexo: " + userAccount3.sexo + " Id: " + userAccount3.id);
