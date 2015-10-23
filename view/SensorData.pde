import java.util.Hashtable;

public class SensorData {
  
  public Hashtable<Integer, Long> distances = new Hashtable<Integer, Long>();
    
  public long getDistance(int degree) {
    if (distances.contains(degree)) return distances.get(degree);
    else return 0;
  }
  
  public void addData(SerialRead read) {
    distances.put(new Integer(read.getDegree()),new Long(read.getDistance()));
  }
  
}