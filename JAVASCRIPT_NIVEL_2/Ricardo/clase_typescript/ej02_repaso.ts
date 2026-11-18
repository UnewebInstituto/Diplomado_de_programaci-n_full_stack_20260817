// Declaración de la interfaz ContactoDetalle
interface ContactoDetalle {
    nombre: string;
    apellido: string;
    correo: string;
    telefono: string;
    direccion: string;
    id: number;
}

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
// Declaracion del arreglo contactos de tipo ContactoDetalle
let contactos: Array<ContactoDetalle> = [];

let n:number = 0;
let nombreEntrada:string;
let apellidoEntrada:string;
let correoEntrada:string;
let telefonoEntrada:string;
let direccionEntrada:string;
let idEntrada:number;

let contacto1: ContactoDetalle = {
    nombre: "Juan",
    apellido: "Perez",
    correo: "juan.perez@example.com",
    telefono: "1234567890",
    direccion: "Calle 123",
    id: 1
};
let contacto2: ContactoDetalle = {
    nombre: "Maria",
    apellido: "Gomez",
    correo: "maria.gomez@example.com",
    telefono: "0987654321",
    direccion: "Avenida 456",
    id: 2
};
let contacto3: ContactoDetalle = {
    nombre: "Carlos",
    apellido: "Lopez",
    correo: "carlos.lopez@example.com",
    telefono: "5555555555",
    direccion: "Boulevard 789",
    id: 3
};