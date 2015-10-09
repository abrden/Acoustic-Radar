import processing.serial.*;
Serial port;

void setup(){
  size(800, 600);
  drawRadar();
 
  port = new Serial(this, Serial.list()[1], 9600);
  
}

void draw() {
  String readString = port.readString();
  
  int readInt = port.read();
  
  if (port.available() > 0) 
  System.out.println("is available");
  else System.out.println("is not available");
  
  
  
  String output = port.readStringUntil('\n');
  System.out.println(output + readInt);
  
  setPoint(50, HALF_PI);
  
}

void drawRadar(){
  int outerRadius = 600;
  int elipseQuantity = 8;
  
  //Outer circle
  fill(0);
  stroke(255);
  
  for (float i = 0 ; i < elipseQuantity ; i++) {
    float currentRadious = outerRadius * (1.0 - i/elipseQuantity); 
    
    arc(width/2, height/2, currentRadious, currentRadious, PI, 2*PI);
  }
  
  // Vertical Axis
  line(width/2, height/2, width/2, 0);
  
  // Horizontal Axis
  line(width - outerRadius - 100, height/2, width - 100, height/2);
  
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