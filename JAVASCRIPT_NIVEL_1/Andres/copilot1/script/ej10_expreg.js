function validarNombre(){
    let expRegNombre = /^[A-ZÁÉÍÓÚÜÑ]+(?: [A-ZÁÉÍÓÚÜÑ]+)*$/;
    let nombre = document.getElementById('nombre');
    let msjNombre = document.getElementById('msjNom');
    msjNombre.style.fontSize = "8px";
    if (expRegNombre.test(nombre.value)){
        msjNombre.style.color = "black";
        msjNombre.innerHTML = '';
        ctrlNombre = true;
    }else{
        msjNombre.style.color = "red";
        msjNombre.innerHTML = 'El contenido del nombre debe ser todo en mayúscula';
        ctrlNombre = false;
    }
    verificarCampos();
}

function validarApellido(){
    let expRegApellido = /^[A-ZÁÉÍÓÚÜÑ]+(?: [A-ZÁÉÍÓÚÜÑ]+)*$/;
    let apellido = document.getElementById('apellido');
    let msjApellido = document.getElementById('msjApe');
    msjApellido.style.fontSize = "8px";
    if (expRegApellido.test(apellido.value)){
        msjApellido.style.color = "black";
        msjApellido.innerHTML = '';
        ctrlApellido = true;
    }else{
        msjApellido.style.color = "red";
        msjApellido.innerHTML = 'El contenido del apellido debe ser todo en mayúscula';
        ctrlApellido = false;
    }
    verificarCampos();
}

function validarCorreoElectronico(){
    const expRegCorreo = /^[A-Za-z0-9]+@[A-Za-z0-9]+(?:\.[A-Za-z0-9]+)*\.[A-Za-z]{2,}$/;
    let correo = document.getElementById('correo');
    let msjCorreo = document.getElementById('msjCor');
    msjCorreo.style.fontSize = "8px";
    if (expRegCorreo.test(correo.value)){
        msjCorreo.style.color = "black";
        msjCorreo.innerHTML = '';
        ctrlCorreo = true;
    }else{
        msjCorreo.style.color = "red";
        msjCorreo.innerHTML = 'El contenido del correo electrónico no es válido';
        ctrlCorreo = false;
    }
    verificarCampos();
}

function validarClave1(){
    const expRegPassword = /^(?=.{8,15}$)[A-Z](?:[A-Za-z0-9]*[*+/?#$!<>=%-][A-Za-z0-9]*)$/;
    let clave1 = document.getElementById('clave1');
    let msjClave1 = document.getElementById('msjCv1');
    msjClave1.style.fontSize = "8px";
    if (expRegPassword.test(clave1.value)){
        msjClave1.style.color = "black";
        msjClave1.innerHTML = '';
        ctrlClave1 = true;
    }else{
        msjClave1.style.color = "red";
        msjClave1.innerHTML = 'El contenido de la clave es incorrecto';
        ctrlClave1 = false;
    }
    verificarCampos();
}

function validarClave2(){
    let clave1 = document.getElementById('clave1');
    let clave2 = document.getElementById('clave2');
    let msjClave2 = document.getElementById('msjCv2');
    msjClave2.style.fontSize = "8px";
    if (ctrlClave1){
        if (clave1.value == clave2.value){
            msjClave2.style.color = "black";
            msjClave2.innerHTML = '';
            ctrlClave2 = true;
        }else{
            msjClave2.style.color = "red";
            msjClave2.innerHTML = 'El contenido debe coíncider con el valor de la clave inicial';
            ctrlClave2 = false;
        }
    }else{
        msjClave2.style.color = "red";
        msjClave2.innerHTML = 'Valor de la  clave inicial no es correcto';
        ctrlClave2 = false;
    }
    verificarCampos();
}

function verificarCampos(){
    let registrar = document.getElementById('btnRegistrar');
    if (ctrlNombre && ctrlApellido && ctrlCorreo && ctrlClave1 && ctrlClave2){
        registrar.disabled = false;
    }else{
        registrar.disabled = true;
    }
}

//Declaraion arrow funtion

const cambiarOjoClave1 = (imgclave1) => {
    if(ctrlOjoClave1){
        imgclave1.src="./imagenes/ojo.png";
        clave1.type = "text";
        ctrlOjoClave1 = false;
    }else{
        imgclave1.src="./imagenes/ojocerrado.png";
        clave1.type = "password";
        ctrlOjoClave1 = true;
    }
}

const cambiarOjoClave2 = (imgclave2) => {
    if(ctrlOjoClave2){
        imgclave2.src="./imagenes/ojo.png";
        clave2.type = "text";
        ctrlOjoClave2 = false;
    }else{
        imgclave2.src="./imagenes/ojocerrado.png";
        clave2.type = "password";
        ctrlOjoClave2 = true;
    }
}

// Declaración
var ctrlNombre, ctrlApellido, ctrlCorreo, ctrlClave1, ctrlClave2, ctrlOjoClave1= true, ctrlOjoClave2= true;
const formularioUsuarios = document.getElementById('formUsuarios');
const mensajeResultado = document.getElementById('mensajeResultado');

// Inicialización
ctrlNombre = ctrlApellido = ctrlCorreo = ctrlClave1 = ctrlClave2 = false, ctrlOjoClave1= true, ctrlOjoClave2= true;

formularioUsuarios.addEventListener("submit", async (evento) => {
    evento.preventDefault();
    mensajeResultado.textContent = "";

    try {
        const respuesta = await fetch(formularioUsuarios.action, {
            method: formularioUsuarios.method,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams(
                new FormData(formularioUsuarios)
            ).toString()
        });

        const texto = await respuesta.text();
        mensajeResultado.textContent = texto;
    } catch (error) {
        console.error(error);
        mensajeResultado.textContent = "No se pudo conectar con el servidor.";
    }
});
