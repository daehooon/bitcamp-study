package test;

public class Engine {
  String maker;
  int valve;
  int cylinder;
  
  public void onSparkPlug() {
    System.out.println("점화플러그 켭니다.");
  }
  
  public void moveMotor() {
    System.out.println("모터 돌립니다.");
  }
  
  public void offSparkPlug() {
    System.out.println("점화플러그 끕니다.");
  }
  
  public void stopMotor() {
    System.out.println("모터 멈춥니다.");
  }
}
