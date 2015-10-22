import processing.serial.*;

Serial port;
SerialReader reader;
Radar radar;
  
void setup() {
  size(800, 600);
  
  //delay(10000);
  port = new Serial(this, Serial.list()[0], 9600);
  reader = new SerialReader(port);
  radar = new Radar();
  
  radar.drawRadar();
}

void draw() {
  
  if (port.available() > 0) {
    radar.addSerialRead(reader.serialEvent());
  }
  
  radar.drawRadar();
}

//SantiTest turbio 
int testingIteration = 0;
int testingPosition = 50;
int testingDegree = 15;

void iterateTestingIteration() {
  testingIteration ++;
  
  if (testingIteration > 2) {
    radar.drawRadarPosition((int)random(testingPosition - 20, testingPosition + 20), testingDegree < 164 ? testingDegree ++ : testingDegree --);
    radar.setPoint((int)random(testingPosition - 20, testingPosition + 20), testingDegree < 164 ? testingDegree ++ : testingDegree --);

    testingIteration = 0;
  } 
}