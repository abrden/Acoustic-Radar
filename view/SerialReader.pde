public class SerialReader {
  
  Serial port;
  
  SerialReader(Serial port) {
    this.port = port;
  }
  
  public void serialEvent() {
    int degree;
    int distance;
  
    String output = port.readStringUntil('\n');  // read the serial port until a new line
    
    // Printeo para la consola
    System.out.print("out");
    System.out.print(output);
    //
    
    if (output != null) {  // if theres data in between the new lines      
      output = trim(output); // get rid of whitespace
      
      try {
      
        String strDegree = output.substring(0, output.indexOf("-"));
        String strDistance = output.substring(output.indexOf("-") + 1, output.length());
        degree = Integer.parseInt(strDegree);
        distance = convertDistanceToPixels(Integer.parseInt(strDistance));
        
      } catch(NumberFormatException|StringIndexOutOfBoundsException e) {
        
        degree = sensorData.getNextDegree();
        distance = sensorData.getDistance(NO_DEGREE_DATA);
      
      }
    }
    
    return new SerialReader(degree, distance);
      
  }

  int convertDistanceToPixels(int distance) {
    int conversionRate = 1;
    return distance * conversionRate;
  }

}