// Función declarativa
function declarativa(a, b){
    return(`Recibi estos dos argumentos ${a}, ${b}`);
}

// Función flecha
const flecha = (a,b) =>{
    return(`Recibi estos dos argumentos ${a}, ${b}`);
}

let x = 'Primer dato';
let y = 12345;

console.log(declarativa(x,y));
console.log('---');
console.log(flecha(x,y));