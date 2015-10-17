import processing.serial.*;

Serial port;
int degree;
int distance;
int MAX_DISTANCE = 600;
int MIN_DISTANCE = 10;
int INNER_RADAR_ELLIPSES = 8;

Radar radar;
  
void setup() {
  size(800, 600);
  
  //uncomment delay when using
  //delay(10000);
  port = new Serial(this, Serial.list()[0], 9600);
  
  radar = new Radar(MAX_DISTANCE, MIN_DISTANCE, INNER_RADAR_ELLIPSES);
  
  radar.drawRadar();
}

void draw() {
  if (port.available() > 0) {
    serialEvent();
  }
  
  int distanceInPixels = convertDistanceToPixels(distance);
  radar.drawRadarPosition(degree, MIN_DISTANCE);
  
  radar.setPoint(distanceInPixels, degree);  
}

int convertDistanceToPixels(int distance) {
  int conversionRate = 1;
  return distance * conversionRate;
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