class GalaAnimationMoire extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question 
  private float txtSize = 70;


  float nodeLocX[]={0, 0, 0, 0, 0};
  float nodeLocY[]={0, 0, 0, 0, 0};
  float totalPoly[]={0, 0, 0, 0, 0};
  float vizObjectsColor[]={0, 0, 0, 0, 0};
  int tally[]={0, 0, 0, 0, 0};

  GalaAnimationMoire(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255, 240, 255);
    for (int i=0; i<5; i++) 
    {
      nodeLocY[i]=(height/2) + random(-100, 300);
      vizObjectsColor[i] = random(0, 255);
    }
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    //background(background);
    background(255);
    textFont(font);
    textSize(txtSize);
    x=100;
    background(255, 255, 190);

    for (int i=0; i<5; i++) 
    {
      x+=(width/7);
      nodeLocX[i]=x;
      nodeLocY[i]=height/2;
      pushMatrix();
      translate(x, nodeLocY[i]);
      rotate(frameCount / -100.0);
      noFill();
      for (int j=0; j<totalPoly[i]; j++) {
        strokeWeight(2);
        stroke(vizObjectsColor[4-i], vizObjectsColor[i], 100);
        polygon(0, 0, (j*6)+20, 7);  // Heptagon
      }
      popMatrix();
    }
    x=100;
    for (int i=0; i<5; i++) 
    {
      x+=(width/7);
      nodeLocX[i]=x;
      textSize(txtSize/5);
      if (tally[i]>0) {
        stroke(vizObjectsColor[4-i], vizObjectsColor[i], 100);
        fill(255);
        ellipse(x, nodeLocY[i], 30, 30);
        fill(0);
        text(tally[i], x, nodeLocY[i]);
      }
      textSize(txtSize);
      fill(0);
      text(question, width/2, qEdgeDist);
    }
  }
  public void keyPressed(int key) {
    float grow = 20;

    switch(key) {
    case '1': 
      totalPoly[0]++;
      tally[0]++;
      break;
    case '2': 
      totalPoly[1]++;
      tally[1]++;
      break;
    case '3': 
      totalPoly[2]++;
      tally[2]++;
      break;
    case '4': 
      totalPoly[3]++;
      tally[3]++;
      break;
    case '5': 
      totalPoly[4]++;
      tally[4]++;
      break;
    case '0':                    //clear animation and provide new question
      if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
        saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
      }
      for (int i=0; i<5; i++) {
        totalPoly[i]=0;
        tally[i]=0;
      }
      x=0;
      fill(255, 240, 255, 40);
      for (int i=0; i<5; i++) 
      {
        nodeLocY[i]=(height/2) + random(-100, 300);
      }
      background(255, 240, 255);
      fill(0);
      textSize(txtSize);
      text(question, width/2, qEdgeDist);
      break;
    }
  }

  void polygon(float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}