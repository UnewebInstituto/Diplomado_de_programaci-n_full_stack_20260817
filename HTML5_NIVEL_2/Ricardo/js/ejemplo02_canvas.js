const canvas = document.getElementById("lienzo");
const ctx = canvas.getContext("2d");
let color = ['yellow','blue','red','orange','green','violet'];
let x, y;
x = 0;
y = 0;
for (let index = 0; index < color.length; index++) {ctx.fillStyle = color[index];        
    ctx.fillRect(x,y,100,100);
    x = x + 100;
    y = y + 100;}
// ctx.fillStyle = "green";
// ctx.fillRect(0,0,100,100);