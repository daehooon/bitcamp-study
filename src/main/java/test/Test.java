package test;

public class Test {
  public static void main(String[] args) {
    Engine setaEngine = new Engine();
    setaEngine.maker = "현대자동차";
    setaEngine.cylinder = 4;
    setaEngine.valve = 16;
    
    Car sonata = new Car(setaEngine);
    
    sonata.start();
    sonata.stop();
  }
}
