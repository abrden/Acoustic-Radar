import processing.serial.*;
Serial port; 

void setup(){
  size(800, 600);
}

void draw() {
  fill(0);
  stroke(255);
  ellipse(width/2, height/2, 600, 600);
  ubicarPunto(100, 0);
}

void ubicarPunto(int distancia, int grado){
  // El punto es graficado en el sistema de coordenadas de la circunferencia. El centro
  // de esta es el origen de coordenadas.
  fill(62, 180, 137);
  stroke(62, 180, 137);
  ellipse(width/2, height/2 - distancia, 5, 5);
}