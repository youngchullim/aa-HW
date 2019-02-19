document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("mycanvas");
  canvasEl.height = 500;
  canvasEl.width = 500;

  const ctx = canvasEl.getContext('2d');

  ctx.fillStyle = "red";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(450, 450, 150, 0, 2 * Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(50, 50, 150, 0, 2 * Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(250, 250, 100, 0, 2 * Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();
  
  ctx.beginPath();
  ctx.arc(450, 50, 150, 0, 2 * Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(50, 450, 150, 0, 2 * Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();
});
