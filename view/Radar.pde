void drawRadar(int outerRadius, int ellipseQuantity) {
  
  //Outer circle
  fill(0);
  stroke(255);
  
  for (float i = 0 ; i < ellipseQuantity ; i++) {
    float currentRadius = outerRadius * (1.0 - i/ellipseQuantity); 
    
    arc(width/2, height/2, currentRadius, currentRadius, PI, 2*PI);
  }
  
  // Vertical Axis
  line(width/2, height/2, width/2, 0);
  
  // Horizontal Axis
  line(width - outerRadius - 100, height/2, width - 100, height/2);
  
}

void drawRadarPosition(float degree, int radarRadius) {
  
  float x = radarRadius * cos(degree);
  float y = radarRadius * sin(degree);
  
  stroke(255, 26, 26);
  line(width/2, height/2, (width + x)/2, (height - y)/2);
}
void setPoint(int distance, float degree) {
  
  float x = distance * cos(degree);
  float y = distance * sin(degree);
  
  fill(62, 180, 137);
  stroke(62, 180, 137);
  ellipse(width/2 + x, height/2 - y, 10, 10);
}