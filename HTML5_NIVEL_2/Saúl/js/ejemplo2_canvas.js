const canvas = document.getElementById("lienzo");
const ctx = canvas.getContext("2d")
/*Declaración de arreglo*/
let color =["yellow","blue", "red","orange","green","violet"]
/*Variables para indicar el punto de origen de cada cuadro de color*/
let x, y;
//inicialización de variables
x = 0;
y = 0;
//ciclo para producir los 6 cuadros
for (let index = 0; index < color.length; index++) {
    ctx.fillStyle = color[index];
    ctx.fillRect(x,y,100,100)
    x = x + 100;
    y = y + 100;
}

//ctx.fillStyle = "green";
//ctx.fillRect(0,0,100,100)