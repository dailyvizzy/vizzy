float x=0; 
float y;   //general x and y
float qEdgeDist = 150;  //y value for question
float txtSize = 70;

String[] pngFiles; 
float randomizer;
float imgOrVec = 0;
int vizGrowth[]={0, 0, 0, 0, 0};
int newloc;
float randomCir = 0;

int vizObjectLocX[]={0, 0, 0, 0, 0};
int vizObjectLocY[]={0, 0, 0, 0, 0};
int vizObjectC[]={100, 130, 180, 200, 240};

float shape = 0;

PImage image;
PImage background;

void setup() {
  background(255);
  fill(0);
  textSize(txtSize);
  size(displayWidth, displayHeight);
  imgOrVec = (int)random(2);
  y=height-70;

  textSize(txtSize/2.1);
  background(255);

  //for(int i = 0; i<100; i++){
  //  randomCir = random(10,150);
  //  noStroke();
  //  fill(random(200,255),random(200,255),255,50);
  //  ellipse(random(width),random(height), randomCir, randomCir);
  //}

  //for (int j = 0; j<height; j+=20) {
  //  for (int i = 0; i<width; i+=20) {
  //    noStroke();
  //    fill(255, 0, 0, 50);
  //    ellipse(i, j, 5, 5);
  //  }
  //}


  for (int j = 0; j<height; j+=100) {
    for (int i = 0; i<width; i+=100) {
      noStroke();
      fill(random(200,255), random(200,255), 0, 50);
      rect(i, j, 100, 100);
    }
  }



  image = loadImage("images/1.png");
}


void draw() {
  x=-50;

  for (int i=0; i<5; i++) 
  {
    x+=(width/6);

    if (imgOrVec == 0) {                 //visualize vector graphic
      stroke(vizObjectC[i]-80, 20, 150, 255);
      strokeWeight(5);
      fill(vizObjectC[i], 50, 190, 255);
      rectMode(CENTER); 
      ellipseMode(CENTER);
      shapeMode(CENTER);
      if (shape==0) {
        rect(x+vizObjectLocX[i], y+vizObjectLocY[i], 30, 30);
      } else {
        ellipse(x+vizObjectLocX[i], y+vizObjectLocY[i], 30, 30);
      }
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
    x=-50;
    y=height-70;
    for (int i=0; i<5; i++) {
      vizObjectLocX[i]=0;
      vizObjectLocY[i]=0;
    }
    background(255);
    fill(0);
    textSize(txtSize);
    text("hello friends", width/2, qEdgeDist);
    imgOrVec = (int)random(2);
    break;
  }
  shape = (int)random(3);
}