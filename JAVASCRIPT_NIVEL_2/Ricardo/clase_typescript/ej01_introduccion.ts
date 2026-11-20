let helloWorld: string;
helloWorld = "Hello World";
/*
Este tipo de asignación no es posible, ya que helloWorld es de tipo string y no se le puede asignar un valor de tipo number.
helloWorld = 0.123;
*/

// Declaración de una interface

interface User{
    name: string;
    id: number;
}

/* La declaración de objetos de tipo User es posible, ya que cumple con la interface definida.
*/

const user: User = {
    name:'Ana Vasquez',
    id:0,
};

const user1: User = {
    name:'Yolanda Tortoza',
    id:1,
};

console.log(typeof(user));
console.log(typeof(user.name));
console.log("Usuario: " + user.name);
console.log(typeof(user.id));
console.log("Id: " + user.id);
console.log("-------------------------------");
console.log(typeof(user1));
console.log(typeof(user1.name));
console.log("Usuario 1: " + user1.name);
console.log(typeof(user1.id));
console.log("Id: " + user1.id);

/**
 * 
Esta declaración no es posible, ya que el objeto user1 no cumple con la interface User, ya que la propiedad nombre no coincide con la propiedad name definida en la interface.

const user1: User ={
    nombre:'Juan Perez',
    id:1,
}
*/

// Declaración de Interface Alumno
interface Alumno{
    nombre: string,
    apellido: string,
    edad: number,
    sexo: string,
    id  : number,
}


// Declaración de clase 
class UserAccount{
    // atributos de la clase
    nombre: string;
    apellido: string;
    edad: number;
    sexo: string;
    id  : number;
    // constructor de la clase
    constructor(nombre: string, apellido: string, edad: number, sexo: string, id: number){
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.sexo = sexo;
        this.id = id;
    }
}

// Instancia de la clase o creación de un objeto de la clase UserAccount
const userAccount1: UserAccount = new UserAccount('Ana', 'Vasquez', 30, 'Femenino', 0);

const userAccount2: UserAccount = new UserAccount('Yolanda', 'Tortoza', 45, 'Femenino', 1);

const userAccount3: UserAccount = new UserAccount('Nelly', 'Contreras', 58, 'Femenino', 2);

// Instancia de la clase o creación de un objeto de la clase
//  UserAccount, pero con el tipo Alumno (interface)
const userAccount4: Alumno = new UserAccount('Libia', 'Cols', 45, 'Femenino', 3);

/**
 * Acceder al contenido de cada objeto
 */
console.log("Usuario 1: " + userAccount1.nombre + " " + userAccount1.apellido + " Edad: " + userAccount1.edad + " Sexo: " + userAccount1.sexo + " Id: " + userAccount1.id);

console.log("Usuario 2: " + userAccount2.nombre + " " + userAccount2.apellido + " Edad: " + userAccount2.edad + " Sexo: " + userAccount2.sexo + " Id: " + userAccount2.id);

console.log("Usuario 3: " + userAccount3.nombre + " " + userAccount3.apellido + " Edad: " + userAccount3.edad + " Sexo: " + userAccount3.sexo + " Id: " + userAccount3.id);

console.log("Usuario 4: " + userAccount4.nombre + " " + userAccount4.apellido + " Edad: " + userAccount4.edad + " Sexo: " + userAccount4.sexo + " Id: " + userAccount4.id);

// Declaracción de tipo
type MyBoolean = true | false;

let myBoolean: MyBoolean = true;
console.log("Tipo de dato MyBoolean: " + typeof(myBoolean));

type WindowStates = "open" | "closed" | "minimized";
type LockStates = "locked" | "unlocked";
type PositiveOddNumbersUnderTen = 1 | 3 | 5 | 7 | 9;

let ventana: WindowStates;
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

function getLength(obj: string | string[]) {
  return obj.length;
}

console.log(getLength("Hola")); // Devuelve 4
console.log(getLength(["Hola", "Mundo"])); // Devuelve 2

function wrapInArray(obj: string | string[]) {
  if (typeof obj === "string") {
    return [obj];
  }
  return obj;
}

console.log(wrapInArray("Hola")); // Devuelve ["Hola"]
console.log(wrapInArray(["Hola", "Mundo"])); // Devuelve ["Hola", "Mundo"]

// Genericos
type StringArray = Array<string>;
type NumberArray = Array<number>;
type ObjectWithNameArray = Array<{ name: string }>;

let stringArray: StringArray = ["Hola", "Mundo"];
let numberArray: NumberArray = [1, 2, 3];
let objectWithNameArray: ObjectWithNameArray = [{ name: "Ana" }, { name: "Yolanda"},{name: "Nelly"},{name: "Libia"}];

// Recorrido de los arrays
console.log("Recorrido del array de strings:");
let i: number = 0;
while (i < stringArray.length) {
    console.log(stringArray[i]);
    i++;
}
console.log("Recorrido del array de números:");
i = 0;
do{ 
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

