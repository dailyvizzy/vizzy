class GalaAnimationTiny extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question 
  private float txtSize = 70;
  private float objSize = 50;
  private float objSpace = 50;

  int vizObjectLocX[]={0, 0, 0, 0, 0};
  int vizObjectLocY[]={0, 0, 0, 0, 0};
  int vizObjectC[]={100, 130, 180, 200, 240};
  float grad[]={20, 50, 70, 90, 100};
  float gradReset[]={20, 50, 70, 90, 100};
  float shape[]={0, 0, 0, 0, 0};
  int tally[]={0, 0, 0, 0, 0};



  GalaAnimationTiny(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    textFont(font);
    background(255);
    textSize(txtSize);
    x=0;
    y=height-40;
    strokeWeight(8);
    stroke(0, 30);
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    x=-240;

    for (int i=0; i<5; i++) 
    {
      x+=(width/5);

      if (imgOrVec == 0) {                 //visualize vector graphic
        stroke(vizObjectC[i]-80, 20, 150, 255);
        strokeWeight(4);
        pushMatrix();
        fill(vizObjectC[i], 50+grad[i], 190, 255);
        popMatrix();
        rectMode(CENTER);  
        ellipseMode(CENTER);
        if (shape[i]==0) {
          rect(x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
        } else {
          ellipse(x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
        }
      }
      if (imgOrVec == 1) {                 //visualize with png
        imageMode(CENTER);
        image(image, x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
      }
    }
    fill(0);
    text(question, width/2, qEdgeDist);
  }

  public void keyPressed(int key) {
    switch(key) {
    case '1': 
      tally[0]++;
      shape[0] = (int)random(3);
      vizObjectLocX[0]+=objSize;
      if (vizObjectLocX[0]>(objSize*4)) {
        vizObjectLocX[0]=0;
        vizObjectLocY[0]-=objSpace;
        grad[0]+=10;
      }
      break;
    case '2':
      tally[1]++;
      shape[1] = (int)random(3);
      vizObjectLocX[1]+=objSize;
      if (vizObjectLocX[1]>(objSize*4)) {
        vizObjectLocX[1]=0;
        vizObjectLocY[1]-=objSpace;
        grad[1]+=10;
      }
      break;
    case '3':
      tally[2]++;
      shape[2] = (int)random(3);
      vizObjectLocX[2]+=objSize;
      if (vizObjectLocX[2]>(objSize*4)) {
        vizObjectLocX[2]=0;
        vizObjectLocY[2]-=objSpace;
        grad[2]+=10;
      }
      break;
    case '4': 
      tally[3]++;
      shape[3] = (int)random(3);
      vizObjectLocX[3]+=objSize;
      if (vizObjectLocX[3]>(objSize*4)) {
        vizObjectLocX[3]=0;
        vizObjectLocY[3]-=objSpace;
        grad[3]+=10;
      }
      break;
    case '5': 
      tally[4]++;
      shape[4] = (int)random(3);
      vizObjectLocX[4]+=objSize;
      if (vizObjectLocX[4]>(objSize*4)) {
        vizObjectLocX[4]=0;
        vizObjectLocY[4]-=objSpace;
        grad[4]+=10;
      }
      break;
    case '0':
      if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
        saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
      }
      x=-50;
      y=height-40;
      for (int i=0; i<5; i++) {
        vizObjectLocX[i]=0;
        vizObjectLocY[i]=0;
        tally[i]=0;
        grad[i]=gradReset[i];
      }

      background(255);
      fill(0);
      textSize(txtSize);
      text("hello friends", width/2, qEdgeDist);
      imgOrVec = (int)random(2);
      break;
    }
  }
}