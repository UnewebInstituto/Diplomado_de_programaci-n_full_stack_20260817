const canvas = document.getElementById("lienzo");
const ctx = canvas.getContext("2d");

// Declaración Array de colores
let color = ['#FF0000', '#00FF00', '#0000FF', '#FFFF00', '#FF00FF', '#00FFFF'];

// Declaración Variables punto de origen
let x, y;

// Inicialización de variables
x = 0;
y = 0;

// Cycle para 6 cuadros
for (let index = 0; index < color.length; index++) {
    ctx.fillStyle = color[index];
    ctx.fillRect(x, y, 100, 100);
    x = x + 100;
    y = y + 100;
}
//ctx.fillStyle = "green";
//ctx.fillRect(0, 0, 100, 100);