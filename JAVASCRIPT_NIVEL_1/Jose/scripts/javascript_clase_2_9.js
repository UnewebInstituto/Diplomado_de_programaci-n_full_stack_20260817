// — Funciones
function registrar(){
  alert("Oprimiendo boton registrar");
}
const lostpassword = () => {
  alert("Oprimiendo boton 'Olvido Contraseña'");
}

// — Variables
const btnIngresar = document.getElementById("ingresar");
const btnRegistrar = document.getElementById("registrar");
const btnLostPassword = document.getElementById("lostpassword");

// — Llamado EventListener
// — 1 Invocacion
btnIngresar.addEventListener("click", ()=>{
  alert("Oprimiendo boton ingresar");
})
// — 2 Invocacion
btnRegistrar.addEventListener("click", registrar);
// — 3 Invocacion
btnLostPassword.addEventListener("click", lostpassword);