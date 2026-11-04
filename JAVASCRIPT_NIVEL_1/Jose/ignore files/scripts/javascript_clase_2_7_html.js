var a, b, c, x1, x2, mensaje, subRadical, respuesta, continuar;

continuar = "S";

while (continuar == "S"){
  // — Lectura de "a" como string
  a = prompt("Ingrese el valor de a:");
  // — Conversion "a" a float
  a = parseFloat(a);

  if (a == 0){
    alert("ERROR: Valor de 'a' no puede ser CERO (0)")
  } else {

    // — Lectura de "b" como string
    b = prompt("Ingrese el valor de b:");
    // — Conversion "b" a float
    b = parseFloat(b);
    // — Lectura de "c" como string + conversion a float
    c = parseFloat(prompt("Ingrese el valor de c:"));
    
    // — "subRadical" formula check
    subRadical = b * b -4 * a * c;

    if (subRadical >= 0){
      x1 = (-b + Math.sqrt (subRadical)) /(2 * a);
      x2 = (-b - Math.sqrt (subRadical)) /(2 * a);
      alert("x1 = " + x1 + "\n" + "x2 = " + x2);

    } else {

      alert("ERROR: Expression Sub Radical debe ser mayor o igual a CERO (0)")

    }
  }
  respuesta = confirm("Desea hacer un nuevo calculo? (S/N)")
  if (respuesta == true){
    continuar = "S"
  } else {
        continuar = "N"

  }
}

alert("Fin del programa");