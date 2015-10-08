import processing.serial.*;
Serial port; 

void setup(){
  size(800, 600);
}

void draw() {
  drawRadar();
  setPoint(50, HALF_PI);
}

void drawRadar(){
  int outer_radius = 600;
  
  //Outer circle
  fill(0);
  stroke(255);
  ellipse(width/2, height/2, outer_radius, outer_radius);
  
  // Inner circles
  ellipse(width/2, height/2, outer_radius*0.75, outer_radius*0.75);

  ellipse(width/2, height/2, outer_radius/3, outer_radius/3); 

  ellipse(width/2, height/2, outer_radius/6, outer_radius/6);
  
  // Vertical Axis
  line(width/2, height, width/2, 0);
  
  // Horizontal Axis
  line(width - outer_radius - 100, height/2, width - 100, height/2);
  
  // Upper Diagonal Axis
}

void setPoint(int distance, float degree){
  // El punto es graficado en el sistema de coordenadas de la circunferencia. El centro
  // de esta es el origen de coordenadas.
  float x = distance * cos(degree);
  float y = distance * sin(degree);
  fill(62, 180, 137);
  stroke(62, 180, 137);
  ellipse(width/2 + x, height/2 - y, 10, 10);
}