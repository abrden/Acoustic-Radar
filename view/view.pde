import processing.serial.*;

Serial port;
int degree;
int distance;

void setup() {
  size(800, 600);
  delay(10000);
  port = new Serial(this, Serial.list()[0], 9600);
  
  drawRadar();
}

void draw() {
  if (port.available() > 0) {
    String output = port.readStringUntil('\n');
    System.out.println(output);
  }

  //serialEvent();
  
  //System.out.print(degree);
  //System.out.print("-");
  //System.out.println(distance);
  
  setPoint(50, HALF_PI);
  
}

void drawRadar() {
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

void serialEvent() {
  
  String output = port.readStringUntil('\n');  // read the serial port until a new line
  
  System.out.print("out");
  System.out.print(output);
   
    if (output != null) {  // if theres data in between the new lines
        
        output = trim(output); // get rid of whitespace
        
        String strDegree = output.substring(0, output.indexOf("-"));
        String strDistance = output.substring(output.indexOf("-") + 1, output.length());
        
        degree = Integer.parseInt(strDegree);
        distance = Integer.parseInt(strDistance);
        
        }
}