package test;

public class Car {
  private Engine engine;
  
  Car(Engine e) {
    this.engine = e;
  }
  
  void start() {
    engine.onSparkPlug();
    engine.moveMotor();
  }
  
  void stop() {
    engine.onSparkPlug();
    engine.stopMotor();
  }
}
