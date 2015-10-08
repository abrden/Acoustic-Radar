import processing.serial.*;
Serial port; 

void setup(){
  size(800, 600);
}

void draw() {
  drawRadar();
  setPoint(100, 0);
}

void drawRadar(){
  fill(0);
  stroke(255);
  ellipse(width/2, height/2, 600, 600);
  
}

void setPoint(int distance, int degree){
  // El punto es graficado en el sistema de coordenadas de la circunferencia. El centro
  // de esta es el origen de coordenadas.
  float x = distance * cos(degree);
  float y = distance * sin(degree);
  fill(62, 180, 137);
  stroke(62, 180, 137);
  ellipse(width/2 + x, height/2 - y, 5, 5);
}