public class SerialReader {
  
  Serial port;
  
  SerialReader(Serial port) {
    this.port = port;
  }
  
  public SerialRead serialEvent() {
    int degree = 0;
    int distance = 0;
  
    String output = port.readStringUntil('\n');  // read the serial port until a new line
    
    // Printeo para la consola
    System.out.print("out");
    System.out.print(output);
    //
    
    if (output != null) {  // if theres data in between the new lines      
      output = trim(output); // get rid of whitespace
   
      String strDegree = output.substring(0, output.indexOf("-"));
      String strDistance = output.substring(output.indexOf("-") + 1, output.length());
      degree = Integer.parseInt(strDegree);
      distance = convertDistanceToPixels(Integer.parseInt(strDistance));
    }
    return new SerialRead(degree, distance);
  }

  private int convertDistanceToPixels(int distance) {
    int conversionRate = 2;
    return distance * conversionRate;
  }
}