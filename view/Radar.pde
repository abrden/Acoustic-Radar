public class Radar {
  
  private int maximumDistance;
  private int minimumDistance;
  private int subdivisions;
 
  public Radar(int maximumDistance, int minimumDistance,int subdivisions) {
    this.maximumDistance = maximumDistance;
    this.minimumDistance = minimumDistance;
    this.subdivisions = subdivisions;
  
  }
  
  public void drawRadar() {
    
    //Outer circle
    fill(0);
    stroke(255);
    
    for (float i = 0 ; i < subdivisions ; i++) {
      float currentRadius = maximumDistance * (1.0 - i/subdivisions); 
      
      arc(width/2, height/2, currentRadius, currentRadius, PI, 2*PI);
    }
    
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