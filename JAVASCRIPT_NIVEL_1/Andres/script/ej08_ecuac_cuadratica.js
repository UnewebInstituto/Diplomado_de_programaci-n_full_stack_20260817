/**
 * Orden natural del código en cualquier
 * aplicación:
 * 1- Declaración de dependencias.
 * 2- Declaración de funciones.
 * 3- Declaración de variables.
 * 4- Cuerpo principal del programa.
 */


// Declaración de función tradicional
function calcular(){
    mensaje = document.getElementById("mensaje");
    a = document.getElementById("a"); // Lectura de "a" como objeto
    a = parseFloat(a.value); // Conversión del valor contenido en "a" a número décimal
    if (a == 0){
        mensaje.className = "error";
        mensajeTmp = "Error: El valor de 'a' debe ser distinto de 0";
    }else{
        b = document.getElementById("b"); // Lectura de "b" como objeto
        b = parseFloat(b.value); // Conversión del valor contenido en "b" a número décimal
        c = parseFloat(document.getElementById("c").value); // Lectura del valor contenido en "c" como cadena de texto y Conversión de "c" a número décimal
        subRadical = b*b-4*a*c;
        if (subRadical >= 0){
            x1 = (-b + Math.sqrt(subRadical))/2*a;
            x2 = (-b - Math.sqrt(subRadical))/2*a;
            mensaje.className = "exito";
            mensajeTmp = `x1 = ${x1} <br> x2 = ${x2}`;
        }else{
            mensaje.className = "alerta";
            mensajeTmp = "Error: Expresión sub radical debe ser mayor o igual a 0";
        }
    }
    mensaje.innerHTML = mensajeTmp;
}

// Arrow function
const limpiar = () => {
    a = document.getElementById("a");
    b = document.getElementById("b");
    c = document.getElementById("c");
    mensaje = document.getElementById("mensaje");
    a.value = '';
    b.value = '';
    c.value = '';
    mensaje.innerHTML = '';
    mensaje.className = '';
}

// Declaración
var a, b, c, x1, x2, subRadical, mensaje, mensajeTmp; 





