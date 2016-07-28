private float x=0; 
private float y=0;   //general x and y
private float qEdgeDist = 150;  //y value for question
private float txtSize = 70;
private float rectHeight=10;    //used for rect height
private float rectWide=220;    //used for rect height

String[] pngFiles;
String[] backFiles;
String pngPath; 
float randomizer;
int imgOrVec = 0;
int vizGrowth[]={0, 0, 0, 0, 0};
int vizObjectsColor[]={10, 60, 120, 160, 200};

PImage image;
PImage background;

public void setup() {
  background(255);
  fill(0);
  textSize(txtSize);

  textSize(txtSize/2.1);
  background(255);

  randomizer = random((int)pngFiles.length);
  PImage png = loadImage(pngPath + "/" + pngFiles[(int)randomizer]);
}

public void update() {
}

public void draw() {

  y=height;
  x=0;

  for (int i=0; i<5; i++) 
  {
    x+=width/6;

    if (imgOrVec == 0) {                 //visualize vector graphic
      strokeWeight(3);
      fill(vizObjectsColor[i], vizObjectsColor[4-i], 195, 30);
      rectMode(CENTER);
      rect(x, y, 230, vizGrowth[i]);
    }
    if (imgOrVec == 1) {                 //visualize with png
      imageMode(CENTER);
      fill(vizObjectsColor[i], 195, vizObjectsColor[4-i], 30);
      image(image, x, y+vizGrowth[i], image.width, image.height);
    }
    fill(0);
  }
  fill(0);
  text("hello fools", width/2, qEdgeDist);
}

public void keyPressed(int key) {
  float grow = 20;

  switch(key) {
  case '1': 
    vizGrowth[0]-=grow;
    break;
  case '2': 
    vizGrowth[1]-=grow;
    break;
  case '3': 
    vizGrowth[2]-=grow;
    break;
  case '4': 
    vizGrowth[3]-=grow;
    break;
  case '5': 
    vizGrowth[4]-=grow;
    break;
  case '0':
    background(255);
    for (int i=0; i<5; i++) {
      vizGrowth[i]=0;
    }
    fill(0);
    textSize(txtSize);
    text("hello fools", width/2, qEdgeDist);
    x=0;
    break;
  }
}