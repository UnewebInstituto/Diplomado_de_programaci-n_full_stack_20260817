/*
  — Orden natural del codigo en cualquier aplicacion:
    1 — Declaracion de Dependencias
    2 — " de Funciones
    3 — " de Variables
    4 — Cuerpo Princpial del Programa
*/

// — Declaracion de funcion
function calcular(){
  mensaje = document.getElementById("mensaje");
  // — Lectura de "a" desde el HTML como objeto
  a = document.getElementById("a");
  // — Conversion del valor "a" a float
  a = parseFloat(a.value);

  if (a == 0){
    mensaje.className = "error";
    mensaje_temp = "ERROR: Valor de 'a' no puede ser CERO (0)";
  } else {

    // — Lectura de "b" desde el HTML como objeto
    b = document.getElementById("b");
    // — Conversion del valor "b" a float
    b = parseFloat(b.value);
    // — Lectura de "c" como string + valor conversion a float
    c = parseFloat(document.getElementById("c").value);
    
    // — "subRadical" formula check
    subRadical = b * b -4 * a * c;

    if (subRadical >= 0){
      x1 = (-b + Math.sqrt(subRadical)) /(2 * a);
      x2 = (-b - Math.sqrt(subRadical)) /(2 * a);

      mensaje.className = "success";
      mensaje_temp = `x1 = ${x1} <br> x2 = ${x1}`;

    } else {
      mensaje.className = "alert";
      mensaje_temp = "ERROR: Expression Sub Radical debe ser mayor o igual a CERO (0)";

    }
  }
  mensaje.innerHTML = mensaje_temp;
}

// — Arrow Function
const limpiar = () => {
  a = document.getElementById("a");
  b = document.getElementById("b");
  c = document.getElementById("c");
  mensaje = document.getElementById("mensaje");
  a.value = '';
  b.value = '';
  c.value = '';
  mensaje.innerHTML = 'CLEAR';
  mensaje.className = '';
}
// — Declaracion de variables
var a, b, c, x1, x2, subRadical, mensaje, mensaje_temp;