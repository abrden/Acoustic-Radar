import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;

Serial port;
Radar radar;

int degree;
float distance, pxDistance;
  
void setup() {
  size(800, 500);
  smooth();
  
  port = new Serial(this, Serial.list()[0], 9600);
  port.bufferUntil('-');
  
  radar = new Radar();
}

void draw() {
  fill(98,245,31);
  noStroke();
  fill(0,4); 
  rect(0, 0, width, 1010);
  fill(98,245,31);
  
  radar.drawRadar(distance, pxDistance, degree);
}

void serialEvent(Serial port) {
  String data = port.readStringUntil('-');
    
  // Printeo para la consola
  //System.out.println("out");
  //System.out.println(data);
  //
  
  try {
  
    data = data.substring(0, data.length() - 1);
    degree = 180 - int(data.substring(0, data.indexOf(",")));
    distance = float(data.substring(data.indexOf(",") + 1, data.length()));
    pxDistance = convertDistanceToPixels(distance);
  
    printData();
    
  } catch (Exception e) {
    System.out.print("Something failed");
  }
  
}

void printData() {
  System.out.print("Degree: ");
  System.out.print(degree);
  System.out.print(" - ");
  System.out.print("Distance: ");
  System.out.println(distance);
}

float convertDistanceToPixels(float distance) {
  float conversionRate = 10; // 1cm = 10px
  return distance * conversionRate;
}