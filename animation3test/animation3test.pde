float x=0; 
float y;   //general x and y
float qEdgeDist = 150;  //y value for question
float txtSize = 70;

String[] pngFiles; 
float randomizer;
float imgOrVec = 0;
int vizGrowth[]={0, 0, 0, 0, 0};
int newloc;

int vizObjectLocX[]={0, 0, 0, 0, 0};
int vizObjectLocY[]={0, 0, 0, 0, 0};

PImage image;
PImage background;

void setup() {
  background(255);
  fill(0);
  textSize(txtSize);
  size(displayWidth, displayHeight);
  //imgOrVec = random(2);
  y=height-70;

  textSize(txtSize/2.1);
  background(255);

  image = loadImage("images/1.png");
}


void draw() {
  x=-50;

  for (int i=0; i<5; i++) 
  {
    x+=(width/6);

    if (imgOrVec == 0) {                 //visualize vector graphic
      strokeWeight(1);
      fill(, 100, 195, 255);
      rectMode(CENTER);
      rect(x+vizObjectLocX[i], y+vizObjectLocY[i], 30, 30);
      println(newloc);
    }
    if (imgOrVec == 1) {                 //visualize with png
      imageMode(CENTER);
      image(image, x+vizObjectLocX[i], y+vizObjectLocY[i], 30, 30);
    }
  }
  fill(0);
  text("hello friends", width/2, qEdgeDist);
}

void keyPressed() {

  switch(key) {
  case '1': 
    vizObjectLocX[0]+=35;
    if (vizObjectLocX[0]>150) {
      vizObjectLocX[0]=0;
      vizObjectLocY[0]-=35;
    }
    break;
  case '2':
    vizObjectLocX[1]+=35;
    if (vizObjectLocX[1]>150) {
      vizObjectLocX[1]=0;
      vizObjectLocY[1]-=35;
    }
    break;
  case '3':
    vizObjectLocX[2]+=35;
    if (vizObjectLocX[2]>150) {
      vizObjectLocX[2]=0;
      vizObjectLocY[2]-=35;
    }
    break;
  case '4': 
    vizObjectLocX[3]+=35;
    if (vizObjectLocX[3]>150) {
      vizObjectLocX[3]=0;
      vizObjectLocY[3]-=35;
    }
    break;
  case '5': 
    vizObjectLocX[4]+=35;
    if (vizObjectLocX[4]>150) {
      vizObjectLocX[4]=0;
      vizObjectLocY[4]-=35;
    }
    break;
  case '0':
    background(255);
    fill(0);
    textSize(txtSize);
    text("hello fools", width/2, qEdgeDist);
    break;
  }
}