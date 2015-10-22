public class Radar {
  
  private int MAX_DISTANCE = 600;
  private int MIN_DISTANCE = 10;
  private int INNER_RADAR_ELLIPSES = 8;
  
  private int maximumDistance;
  private int minimumDistance;
  private int subdivisions;

  SensorData sensorData;
 
  public Radar() {
    this.maximumDistance = MAX_DISTANCE;
    this.minimumDistance = MIN_DISTANCE;
    this.subdivisions = INNER_RADAR_ELLIPSES;
    sensorData = new SensorData();
  }
  
  public void drawRadar() {
    drawDivisions();
    drawLines();
    drawReadings();
  }
  
  public void addSerialRead(SerialRead read) {
    sensorData.addData(read);
  }
  
  private void drawDivisions() {
    fill(0);
    stroke(255);
    
    for (float i = 0 ; i < subdivisions ; i++) {
      float currentRadius = maximumDistance * (1.0 - i/subdivisions); 
      
      arc(width/2, height/2, currentRadius, currentRadius, PI, 2*PI);
    }
    
  }
  
  private void drawReadings() {
    for (String key : sensorData.keySet()) {
      drawRadarPosition(sensorData.get(key), String.toInteger(key));
    }
  }
  
  private void drawLines() {
    line(width/2, height/2, width/2, 0);
    line(width - maximumDistance - 100, height/2, width - 100, height/2);
  }
  
  void drawRadarPosition(int radarRadius, float degree) {
    float x = radarRadius * cos(radians(degree));
    float y = radarRadius * sin(radians(degree));
    
    stroke(255, 26, 26);
    line(width/2, height/2, (width + x)/2, (height - y)/2);
  }
  
  void setPoint(int distance, float degree) {    
    float x = distance * cos(radians(degree));
    float y = distance * sin(radians(degree));
    
    fill(62, 180, 137);
    stroke(62, 180, 137);
    ellipse(width/2 + x, height/2 - y, 10, 10);
  }
  
}