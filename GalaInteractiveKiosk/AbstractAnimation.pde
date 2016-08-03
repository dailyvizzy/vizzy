int big = 0;

public class AbstractAnimation {

  PApplet app;
  PGraphics canvas;

  String question;
  PFont font;
  PImage image;
  PImage background;
  int imgOrVec;
  int w, h;
  float qEdgeDist = 150;  //y value for question
  int txtSize = 70;
  

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

  void renderText(){   
     fill(0);
     textFont(font);
     textSize(txtSize);
     text(question, width/2, qEdgeDist);
  }
  

  /*ANIMATE BACKGROUNDS*/
  
  void dots() {
    for (int j = 0; j<height; j+=30) {
      for (int i = 0; i<width; i+=30) {
        noStroke();
        fill(200, 0, 0, 70);
        ellipse(i+random(0, 2), j+random(0, 2), 5, 5);
      }
    }
  }
  
  void splatter() {
    float randomCir = 0;
    for (int i = 0; i<100; i++) {
      randomCir = random(10, 150);
      noStroke();
      fill(random(200, 255), random(200, 255), 255, 50);
      ellipse(random(width), random(height), randomCir, randomCir);
    }
  }
  
  
  void boxy() {
    for (int j = 0; j<(height+100); j+=100) {
      for (int i = 0; i<width; i+=100) {
        noStroke();
        fill(random(200, 255), random(200, 255), 255, 50);
        rect(i, j, 100, 100);
      }
    }
  }
  
  void falling() {
  }
    

  void diagonals() {
    noFill();
    strokeWeight(20);
    stroke(200, 170, 10, 40);
    for (int i=-width; i<width; i+=random(20, 25)) {
      line(0+i, 0, width+i, height);
    }
  }

}