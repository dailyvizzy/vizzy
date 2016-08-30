float pick=0;

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

  void renderText() {   
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

  void woven() {
    background(255);
    strokeWeight(2);
    for (int col=0; col<(height+1000); col+=100) {

      for (int row =0; row<(width+1000); row+=100) {
        stroke(random(255), 40, random(255), 30);
        pick = (int)random(2);
        //println(pick + " " + row + " " +col);
        for (int i = 0; i<=100; i+=10) {
          if (pick==1) {
            line(row+i, col, row+i, col+100);
          } else {
            line(row, col+i, row+100, col+i);
          }
        }
      }
    }
  }


  void diagonals() {
    noFill();
    strokeWeight(20);
    stroke(200, 170, 10, 40);
    for (int i=-width; i<width; i+=random(20, 25)) {
      line(0+i, 0, width+i, height);
    }
  }
  
  int xspacing = 16; 
  float theta = 0.0;  // Start angle at 0  
  float amplitude = 40.0;  // Height of wave
  float period = 400.0;  // How many pixels before the wave repeats
  float dx;  // Value for incrementing X, a function of period and xspacing
  float[] yvalues;  // Using an array to store height values for the wave
  
  int ampVal[]={10,10,10,10,10};
  int vizObjectsColor[]={10, 60, 120, 160, 200};
  int yPositions[]={300, 450, 600, 750, 900};
    
  void sineCircles() {
   
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
    
    calcWave();
    renderWave();
    
    
  }
  
   void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.05;
      
    // For every x value, calculate a y value with sine function
      for (int i=0; i<5; i++) 
      { 
        float x = theta;
        for (int j = 0; j < yvalues.length; j++) {
          //println(ampVal[i]);
          yvalues[j] = sin(x)*amplitude;
          x+=dx;
        }
      }
  }
  
  void renderWave() {
    
     for (int i=0; i<5; i++) 
      {
        //strokeWeight(2);
        noStroke();
        fill(vizObjectsColor[i], vizObjectsColor[4-i], 195, 30);
        //stroke(0);
        // A simple way to draw the wave with an ellipse at each location
        for (int x = 0; x < yvalues.length; x++) {
          ellipse(x*xspacing, yPositions[i]+yvalues[x], 15, 15);
        }
        
      }
  }
}