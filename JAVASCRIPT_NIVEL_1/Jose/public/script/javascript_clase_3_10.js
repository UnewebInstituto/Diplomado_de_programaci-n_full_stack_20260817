// — START
// — Declaración variables para verificarCampos
let controlNombre, controlApellido, controlEmail, controlPassword1, controlPassword2;

// — Inicialización desactiva variables
controlNombre = controlApellido = controlEmail = controlPassword1 = controlPassword2 = false;

const inputNombre = document.getElementById('nombre');
const mensajeNombre = document.getElementById('mensajeNombre');
const inputApellido = document.getElementById('apellido');
const mensajeApellido = document.getElementById('mensajeApellido');
const inputEmail = document.getElementById('email');
const mensajeEmail = document.getElementById('mensajeEmail');
const inputPassword1 = document.getElementById('password1');
const mensajePassword1 = document.getElementById('mensajePassword1');
const inputPassword2 = document.getElementById('password2');
const mensajePassword2 = document.getElementById('mensajePassword2');

function validarNombre(){

  let nombre = inputNombre.value;
  const expresionRegularNombre = (/^[A-ZÁÉÍÓÚÜÑ]+(?: [A-ZÁÉÍÓÚÜÑ]+)*$/);

  mensajeNombre.style.fontSize = "8px";

  if (expresionRegularNombre.test(nombre)){

    mensajeNombre.style.color = "gray";
    mensajeNombre.innerHTML = 'Nombre válido';
    controlNombre = true;

  } else {

    mensajeNombre.style.color = "red";
    mensajeNombre.innerHTML = 'Nombre debe escribirse en mayuscula';
    controlNombre = false;

  }

    verificarCampos();

}

function validarApellido(){

    let apellido = inputApellido.value;
    const expresionRegularApellido = /^[A-ZÁÉÍÓÚÜÑ]+(?: [A-ZÁÉÍÓÚÜÑ]+)*$/;

    mensajeApellido.style.fontSize = "8px";

    if (expresionRegularApellido.test(apellido)){

      mensajeApellido.style.color = "gray";
      mensajeApellido.innerHTML = 'Apellido válido';
      controlApellido = true;

    } else {

      mensajeApellido.style.color = "red";
      mensajeApellido.innerHTML = 'Apellido debe escribirse en mayuscula';
      controlApellido = false;

    }

    verificarCampos();

}

function validarEmail(){

    let email = inputEmail.value;
    const expresionRegularEmail = /^[A-Za-z0-9]+@[A-Za-z0-9]+(?:\.[A-Za-z0-9]+)*\.[A-Za-z]{2,}$/;

    mensajeEmail.style.fontSize = "8px";

    if (expresionRegularEmail.test(email)){

      mensajeEmail.style.color = "gray";
      mensajeEmail.innerHTML = 'Email válido';
      controlEmail = true;
        
    } else {

      mensajeEmail.style.color = "red";
      mensajeEmail.innerHTML = 'Email incorrecto (ejemplo: abc@def.com)';
      controlEmail = false;

    }

    verificarCampos();

}

function validarPassword1(){

    let password1 = inputPassword1.value;
    const expresionRegularPassword = /^(?=.{8,15}$)[A-Z](?:[A-Za-z0-9]*[*+/?#$!<>=%-][A-Za-z0-9]*)$/;

    mensajePassword1.style.fontSize = "8px";

    if (expresionRegularPassword.test(password1)){

      mensajePassword1.style.color = "gray";
      mensajePassword1.innerHTML = 'Password valido';
      controlPassword1 = true;

    } else {

      mensajePassword1.style.color = "red";
      mensajePassword1.innerHTML = 'Password incorrecto (ejemplo Password*123)';
      controlPassword1 = false;

    }

    verificarCampos();

}

function validarPassword2(){
	
    let password1 = inputPassword1.value;
    let password2 = inputPassword2.value;
	
    mensajePassword2.style.fontSize = "8px";
	
   if (controlPassword1){
	
       if (password1 == password2){
		
           mensajePassword2.style.color = "gray";
           mensajePassword2.innerHTML = 'Password si coincide';
           controlPassword2 = true;
			
       } else {

          mensajePassword2.style.color = "red";
          mensajePassword2.innerHTML = 'Password no coincide';
          controlPassword2 = false;
		
       }
		
   } else {
	
      mensajePassword2.style.color = "red";
      mensajePassword2.innerHTML = 'Primer Password incorrecto';
      controlPassword2 = false;
		
  }
}

inputNombre.addEventListener("blur", validarNombre)
inputApellido.addEventListener("blur", validarApellido)
inputEmail.addEventListener("blur", validarEmail)
inputPassword1.addEventListener("blur", validarPassword1)
inputPassword2.addEventListener("blur", validarPassword2)

function verificarCampos(){

    let botonRegistrar = document.getElementById('btnRegistrar');

    if (controlNombre && controlApellido && controlEmail && controlPassword1 && inputPassword2){

        botonRegistrar.disabled = false;
        
    } else {

        botonRegistrar.disabled = true;
    }

}
