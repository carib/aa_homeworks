document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');

  // Fill color
  ctx.fillStyle = 'green';
  // Dimensions: (x, y, width, height)
  ctx.fillRect(10, 10, 100, 100);


  ctx.beginPath();
  ctx.strokeStyle = 'blue';
  // (x, y, radius, startAngle, endAngle, anticlockwise)
  ctx.arc(250, 75, 50, 0, 2 * Math.PI);
  ctx.stroke();
  ctx.fillStyle = 'pink';
  ctx.fill();
});
