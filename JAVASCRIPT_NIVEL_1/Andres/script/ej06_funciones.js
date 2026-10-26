//Funcion declarativa
function declarativa(a, b){
    return(`Recibi estos dos valores ${a}, ${b}`);
}

//Funcion flecha
const flecha = (a, b) =>{
    return(`Recibi estos dos valores ${a}, ${b}`);
}

let x = 'Primer dato';
let y = 12345;

console.log(declarativa(x,y));
console.log('---');
console.log(flecha(x,y));

//Hacer la serie fibonacci con valores fijos