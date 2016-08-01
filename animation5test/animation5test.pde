float x=0;
float y=0;
float cir=10;
float txtSize=70;
float qEdgeDist = 100;  //y value for question 

PFont font;

int tally[]={0, 0, 0, 0, 0};
float nodeLocX[]={0, 0, 0, 0, 0};
float nodeLocY[]={0, 0, 0, 0, 0};
float totalPoly[]={0, 0, 0, 0, 0};
float vizObjectsColor[]={0, 0, 0, 0, 0};

void setup() {
  fullScreen();
  background(255, 240, 255);
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
  for (int i=0; i<5; i++) 
  {
    nodeLocY[i]=(height/2) + random(-100, 300);
    vizObjectsColor[i] = random(0, 255);
  }

  printArray(PFont.list());
  font = createFont("3Dumb.ttf", 80);
  //textFont(font);
  fill(0);
}

void draw() {
  //textFont(font);
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
    text("Last Weekend was fun!!!", width/2, qEdgeDist);
  }
}
void keyPressed() {
  float antennaX = random(-280, 280);
  float antennaY = random(-280, 280);

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
      //saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
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
    text("are you feeling funky?", width/2, qEdgeDist);
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