// Declaración de la clase Contacto
class Contacto {
    // atrubutos de la clase
    nombre: string;
    apellido: string;
    correo: string;
    telefono: string;
    direccion: string;
    id: number;
    // Métodos de la clase
    constructor(nom:string, ape:string, cor:string, tel:string, dir: string, id:number) {
        this.nombre = nom;
        this.apellido = ape;
        this.correo = cor;
        this.telefono = tel;
        this.direccion = dir;
        this.id = id;
    }
}

// Instancia de la clase Contacto

let contacto0: Contacto = new Contacto(
    "Juan",
    "Perez",
    "juan.perez@example.com",
    "1234567890",
    "Calle 123",
    1
);
let contacto1: Contacto = new Contacto(
    "Maria",
    "Gomez",
    "maria.gomez@example.com",
    "0987654321",
    "Avenida 456",
    2
);
let contacto2: Contacto = new Contacto(
    "Carlos",
    "Lopez",
    "carlos.lopez@example.com",
    "5555555555",
    "Boulevard 789",
    3
);
// Declaración de un arreglo de contactos
// de tipo clase Contacto y se inicializa
// como un arreglo vacío
let contactos: Array<Contacto> = [];
//let contactos: Contacto[] = [];

// Agregar los contactos al arreglo contactos
contactos.push(contacto0);
contactos.push(contacto1);
contactos.push(contacto2);

// Imprimir los contactos en la consola
console.log("Lista de contactos:");

for (const contacto of contactos) {
    console.log(`Nombre: ${contacto.nombre}, Apellido: ${contacto.apellido}, Correo: ${contacto.correo}, Teléfono: ${contacto.telefono}, Dirección: ${contacto.direccion}, ID: ${contacto.id}`);
}
