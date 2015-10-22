public class SensorData {
  
  Hashtable<int, long> distances = new Hashtable<int, long>();
    
  public long getDistance(int degree) {
    if (distances.contains(degree)) return distances.get(degree);
    else return 0;
  }
  
  public void addData(SerialRead read) {
    distances.put(read.getDegree(), read.getDistance());
  }