// Declaración de funciones
function registrar(){
    alert("Estas oprimiendo el botón registrar");
}

// función anonima
const olvidar = () =>{
    alert("Estas oprimiendo el botón olvidó contraseña");
}

// Declaración de variables
const btnIngresar = document.getElementById("ingresar");
const btnRegistrar = document.getElementById("registrar");
const btnOlvido = document.getElementById("olvidar");

// Cuerpo principal del programa
// 1ra. Forma de Invocación
btnIngresar.addEventListener("click", ()=>{
    alert("Estas oprimiendo el botón ingresar");
})

// 2da. Forma de Invocación
btnRegistrar.addEventListener("click", registrar);

// 3ra. Forma de Invocación, llamado a función anonima
btnOlvido.addEventListener("click", olvidar);