public class AbstractAnimation {
  
  PApplet app;
  PGraphics canvas;
  
  String question;
  PFont font;
  PImage image;
  PImage background;
  int w, h;
  
  AbstractAnimation (PApplet app) 
  {
    this.app = app;
    size(width, height);
  }
  
  public void size(int w, int h) 
  { 
     println(getName());
     println(w);
     println(h);
     this.w = w;
     this.h = h;  
  }
  
  public void setup(){
  }
  
  public void update(){
  }
  
  
  public void draw(){
  }
  
  public void keyPressed(int key) {
  }
  
  String getName() {
    return this.getClass().getSimpleName();
  }
  
}