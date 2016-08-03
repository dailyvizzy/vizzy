class GalaAnimationAntenna extends AbstractAnimation {

  float x=0;
  int vizObjectsColor[]={160, 120, 80, 60, 20};
  int tally[]={0, 0, 0, 0, 0};
  float nodeLocX[]={0, 0, 0, 0, 0};
  float nodeLocY[]={0, 0, 0, 0, 0};

  GalaAnimationAntenna(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    fullScreen();
    background(255, 240, 255);
    splatter();

    for (int i=0; i<5; i++) 
    {
      nodeLocY[i]=(height/2) + random(-100, 300);
    }
    renderText();
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    x=100;

    for (int i=0; i<5; i++) 
    {
      x+=(width/7);
      nodeLocX[i]=x;
      strokeWeight(3);
      stroke(vizObjectsColor[4-i], vizObjectsColor[i], 170, 255);
      fill(255, 240, 255, 40);
      ellipse(x, nodeLocY[i], 50, 50);
      fill(vizObjectsColor[4-i], vizObjectsColor[i], 170, 255);
      textSize(txtSize/2);
      if (tally[i]>0) {
        text(tally[i], x, nodeLocY[i]-2);
      }
    }
    renderText();
  }

  public void keyPressed(int key) {
    float antennaX = random(-280, 280);
    float antennaY = random(-280, 280);

    switch(key) {
    case '1': 
      stroke(vizObjectsColor[4], vizObjectsColor[0], 170, 255);
      fill(vizObjectsColor[4], vizObjectsColor[0], 170, 150);
      line(nodeLocX[0], nodeLocY[0], nodeLocX[0]+antennaX, nodeLocY[0]+antennaY);
      ellipse(nodeLocX[0]+antennaX, nodeLocY[0]+antennaY, 10, 10);
      tally[0]++;
      break;
    case '2': 
      stroke(vizObjectsColor[3], vizObjectsColor[1], 170, 255);
      fill(vizObjectsColor[3], vizObjectsColor[1], 170, 150);
      line(nodeLocX[1], nodeLocY[1], nodeLocX[1]+antennaX, nodeLocY[1]+antennaY);
      ellipse(nodeLocX[1]+antennaX, nodeLocY[1]+antennaY, 10, 10);
      tally[1]++;
      break;
    case '3': 
      stroke(vizObjectsColor[2], vizObjectsColor[2], 170, 255);
      fill(vizObjectsColor[2], vizObjectsColor[2], 170, 150);
      line(nodeLocX[2], nodeLocY[2], nodeLocX[2]+antennaX, nodeLocY[2]+antennaY);
      ellipse(nodeLocX[2]+antennaX, nodeLocY[2]+antennaY, 10, 10);
      tally[2]++;
      break;
    case '4': 
      stroke(vizObjectsColor[1], vizObjectsColor[3], 170, 255);
      fill(vizObjectsColor[1], vizObjectsColor[3], 170, 150);
      line(nodeLocX[3], nodeLocY[3], nodeLocX[3]+antennaX, nodeLocY[3]+antennaY);
      ellipse(nodeLocX[3]+antennaX, nodeLocY[3]+antennaY, 10, 10);
      tally[3]++;
      break;
    case '5': 
      stroke(vizObjectsColor[0], vizObjectsColor[4], 170, 255);
      fill(vizObjectsColor[0], vizObjectsColor[4], 170, 150);
      line(nodeLocX[4], nodeLocY[4], nodeLocX[4]+antennaX, nodeLocY[4]+antennaY);
      ellipse(nodeLocX[4]+antennaX, nodeLocY[4]+antennaY, 10, 10);
      tally[4]++;
      break;
    case '0':                    //clear animation and provide new question
      if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
         super.saveVizImg();
      }
      for (int i=0; i<5; i++) {
        tally[i]=0;
      }
      textSize(txtSize);
      x=0;
      fill(255, 240, 255, 40);
      for (int i=0; i<5; i++) 
      {
        nodeLocY[i]=(height/2) + random(-100, 300);
      }
      renderText();
      break;
    }
  }
}