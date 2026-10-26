let estudiantes = []; // 1ra. forma de declaración
let asignaturas = Array(); // 2da. forma de declaración

console.log('Tipo de dato:');
console.log(typeof(estudiantes));
console.log(typeof(asignaturas));

estudiantes = ['JOSÉ','ANDRÉS','RICARDO'];
console.log(estudiantes);

/**
 * Por tratarse de un objeto, soporta una serie de métodos
 * vinculados al tipo de dato
 */
asignaturas.push('HTML5');
asignaturas.push('LÓGICA DE PROGRAMACIÓN');
asignaturas.push('MYSQL');
asignaturas.push('POSTGRESQL');
asignaturas.push('IA PARA PROGRAMADORES');
console.log('Contenido de asignaturas');
console.log(asignaturas);
/**
 * Recorrido de ambas estructuras
 */
console.log('Estudiantes del Diplomado');
let i = 0;
while (i < estudiantes.length){
    console.log(estudiantes[i]);
    i = i + 1;
}
console.log('---');
i = 0;
do{
    console.log(estudiantes[i]);
    i = i + 1;
} while (i < estudiantes.length);
console.log('---');
for (i=0; i < estudiantes.length; i++) {
    console.log(estudiantes[i]);
}
// Recorrido empleando un objeto
estudiantes.forEach(nombre => {
    console.log(nombre);
});

