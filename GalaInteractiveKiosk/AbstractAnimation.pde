public class AbstractAnimation {

  PApplet app;
  PGraphics canvas;

  String question;
  PFont font;
  PImage image;
  PImage background;
  int imgOrVec;
  int w, h;

  AbstractAnimation (PApplet app) 
  {
    this.app = app;
    imgOrVec = 0;
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

  public void setup() {
  }

  public void update() {
  }


  public void draw() {
  }

  public void keyPressed(int key) {
  }

  String getName() {
    return this.getClass().getSimpleName();
  }

  String timestamp() {
    Calendar now = Calendar.getInstance();
    return String.format("%1$th-%1$td-%1$ty_%1$tH%1$tM%1$tS", now);
  }
  void saveVizImg() {
    saveFrame("/Users/gala/Dropbox/saved_daily_images/GALAdaily_"+timestamp()+".png");
  }
}