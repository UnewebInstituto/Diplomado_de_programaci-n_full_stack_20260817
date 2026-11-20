"use strict";
// Declaracion del arreglo contactos de tipo ContactoDetalle
let contactos = [];
// Se inicializan tres contactos de ejemplo
let contacto0 = {
    nombre: "Juan",
    apellido: "Perez",
    correo: "juan.perez@example.com",
    telefono: "1234567890",
    direccion: "Calle 123",
    id: 1
};
let contacto1 = {
    nombre: "Maria",
    apellido: "Gomez",
    correo: "maria.gomez@example.com",
    telefono: "0987654321",
    direccion: "Avenida 456",
    id: 2
};
let contacto2 = {
    nombre: "Carlos",
    apellido: "Lopez",
    correo: "carlos.lopez@example.com",
    telefono: "5555555555",
    direccion: "Boulevard 789",
    id: 3
};
// Agregar los contactos al arreglo contactos
contactos.push(contacto0);
contactos.push(contacto1);
contactos.push(contacto2);
// Imprimir los contactos en la consola
console.log("Lista de contactos:");
for (const contacto of contactos) {
    console.log(`Nombre: ${contacto.nombre}, Apellido: ${contacto.apellido}, Correo: ${contacto.correo}, Teléfono: ${contacto.telefono}, Dirección: ${contacto.direccion}, ID: ${contacto.id}`);
}
