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

console.log("password1", password1);
console.log("password2", password2);
	
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

console.log("controlNombre", controlNombre);
console.log("controlApellido", controlApellido);
console.log("controlEmail", controlEmail);
console.log("controlPassword1", controlPassword1);
console.log("controlPassword2", controlPassword2);

    if (controlNombre && controlApellido && controlEmail && controlPassword1 && controlPassword2){

        botonRegistrar.disabled = false;
        
    } else {

        botonRegistrar.disabled = true;
    }

}

const togglePassword1 = document.getElementById('password1');
const togglePassword2 = document.getElementById('password2');
const toggleIcon = document.getElementById('toggleIcon');

toggleIcon.addEventListener('click', function () {
  // Toggle the type attribute
  if (togglePassword1.type === 'password') {
    togglePassword1.type = 'text';
    togglePassword2.type = 'text';
    toggleIcon.textContent = '(hide)👁️'; // Optional: Change icon to indicate hidden state
  } else {
    togglePassword1.type = 'password'; 
    togglePassword2.type = 'password';
    toggleIcon.textContent = '(show)🔒'; // Change back to open eye
  }
});

let revealStatus2;
revealStatus2 = true;

const revelarClave2 = (revealClave2) =>{
    if (revealStatus2){
        revealClave2.src="./img/eyeopen.png";
        togglePassword2.type = "text";
        revealStatus2 = false;
    }else{
        revealClave2.src="./img/eyeclose.png"; 
        togglePassword2.type = "password";
        revealStatus2 = true;
    }
}

const formSendUser = document.getElementById("formUsuario");
const mensajeResultado = document.getElementById("mensajeResultado");

formSendUser.addEventListener("submit", async (evento) => {
    evento.preventDefault();
    mensajeResultado.textContent = "";

    try {
        const respuesta = await fetch(formSendUser.action, {
            method: formSendUser.method,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams(
                new FormData(formSendUser)
            ).toString()
        });

        const texto = await respuesta.text();
        mensajeResultado.textContent = texto;
    } catch (error) {
        console.error(error);
        mensajeResultado.textContent = "No se pudo conectar con el servidor.";
    }
});