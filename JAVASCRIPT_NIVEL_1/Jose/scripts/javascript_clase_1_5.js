let estudiantes = []; // Array declaracion corchete
let asignaturas = Array(); // Array declaracion parenthesis

console.log('Tipo de dato:');
console.log(typeof(estudiantes));
console.log(typeof(asignaturas));

estudiantes = ['JOSE','ANDRES','RICARDO'];
console.log(estudiantes);

/*
    Por tratarse de un objeto, este soporta series de metodos vinculados al tipo de dato
*/
asignaturas.push('HTML5');
asignaturas.push('LOGICA DE PROGRAMACION');
asignaturas.push('MYSQL');
asignaturas.push('POSTGRESQL');
asignaturas.push('AI PARA PROGRAMADORES');
console.log('Contenido de Asignaturas');
console.log(asignaturas);

/*
    Recorrido ++i de ambas estructuras
*/
let i = 0;
while (i < estudiantes.length){
    console.log(estudiantes[i]);
    i = i + 1;
}
console.log('---');

i = 0;
do{
    console.log(estudiantes[i]);
   i++;
} while (i < estudiantes.length);
console.log('---');

for (i=0; i < estudiantes.length; i++) {
    console.log(estudiantes[i]);
}
console.log('---');

//  Recorrido a traves de objeto
estudiantes.forEach(nombre => {
    console.log(nombre);
});
