import processing.serial.*;


Serial port;
int degree;
int distance;
int RADAR_RADIUS = 600;
int INNER_RADAR_ELLIPSES = 8;
  
void setup() {
  size(800, 600);
  delay(10000);
  port = new Serial(this, Serial.list()[0], 9600);
  

  drawRadar(RADAR_RADIUS, INNER_RADAR_ELLIPSES);
}

void draw() {
  /*
  if (port.available() > 0) {
    String output = port.readStringUntil('\n');
    System.out.println(output);
  }
  */
  serialEvent();
  
  //System.out.print(degree);
  //System.out.print("-");
  //System.out.println(distance);
  
  int distanceInPixels = convertDistanceToPixels(distance);
  drawRadarPosition(degree, RADAR_RADIUS);
  setPoint(distanceInPixels, degree);
  
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