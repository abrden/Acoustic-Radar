import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;

Serial port;
Radar radar;

int degree, distance;
float pxDistance;
  
void setup() {
  size(800, 500);
  smooth();
  
  //delay(500);
  port = new Serial(this, Serial.list()[0], 9600);
  port.bufferUntil('.');
  
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
  String data = port.readStringUntil('.');
    
  // Printeo para la consola
 System.out.println("" + degree +" - "+ distance);
  //
  
  try {
  
    data = data.substring(0, data.length() - 1);
    degree = int(data.substring(0, data.indexOf(",")));
    distance = int(data.substring(data.indexOf(",") + 1, data.length()));
    pxDistance = convertDistanceToPixels(distance);
  
  } catch (Exception e) {
    System.out.print("Something failed");
  }
}

float convertDistanceToPixels(int distance) {
  float conversionRate = 5; // 1cm = 5px
  return distance * conversionRate;
}