var a, b, c, x1, x2, subRadical, continuar, respuesta;
continuar = "S";
while (continuar == "S"){
    a = prompt("Ingrese el valor de a:"); // Lectura de "a" como cadena de texto
    a = parseFloat(a); // Conversión de "a" a número décimal
    if (a == 0){
        alert("Error: El valor de 'a' debe ser distinto de 0");
    }else{
        b = prompt("Ingrese el valor de b:"); // Lectura de "b" como cadena de texto
        b = parseFloat(b); // Conversión de "a" a número décimal
        c = parseFloat(prompt("Ingrese el valor de c:")); // Lectura de "c" como cadena de texto y Conversión de "c" a número décimal
        subRadical = b*b-4*a*c;
        if (subRadical >= 0){
            x1 = (-b + Math.sqrt(subRadical))/2*a;
            x2 = (-b - Math.sqrt(subRadical))/2*a;
            alert("x1 = " + x1 + "\n" + "x2 = " + x2);
        }else{
            alert("Error: Expresión sub radical debe ser mayor o igual a 0")
        }
    }
    respuesta = confirm("¿Desea efectuar un nuevo cálculo?")
    if (respuesta == true){
        continuar = "S"
    }else{
        continuar = "N"
    }
}
alert("Fin del programa");

