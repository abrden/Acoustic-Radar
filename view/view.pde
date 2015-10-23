import processing.serial.*;

Serial port;
SerialReader reader;
Radar radar;
  
void setup() {
  size(800, 600);
  
  delay(500);
  port = new Serial(this, Serial.list()[0], 9600);
  reader = new SerialReader(port);
  radar = new Radar();
  
  radar.drawRadar();
}

void draw() {
  
  if (port.available() > 0) {
   
    try {
      radar.addSerialRead(reader.serialEvent());
    } catch (Exception e) {
      System.out.println("failure");
    
    }
  }
  
  radar.drawRadar();
}