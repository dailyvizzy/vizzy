float x=0;
float y=0;
float cir=10;

PFont f;

PImage img;  // Declare variable "a" of type PImage

int vizObjectsCir[]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

int vizObjectsColor[]={10, 30, 60, 90, 120, 140, 160, 180, 200, 230};

void setup() {
  fullScreen();
  background(255);

  printArray(PFont.list());
  f = createFont("3Dumb.ttf", 80);
  textFont(f);
  fill(0);
  text("How excited are you?", width/2-300, 150);

  img = loadImage("images/1.png");

  for (int i=0; i<10; i++) {
    x+=width/11;
    strokeWeight(3);
    stroke(0, 230);
    fill(0);
    y=height/2;
    textSize(50);
    text(i+1, x, height-100);
  }
}

void draw() {
  y=height/2;
  x=0;

  for (int i=0; i<10; i++) {
    x+=width/11;
    pushMatrix();
    strokeWeight(3);
    stroke(0, 230);
    fill(vizObjectsColor[i], 195, vizObjectsColor[9-i], 30);
    popMatrix();
    ellipse(x, y, vizObjectsCir[i], vizObjectsCir[i]);
    fill(0); 
    textSize(70);
    //text("How excited are you?", width/2-200, 120);
    image(img, 20, 40);
  }
}


void keyPressed() {
  float grow = 20;
  switch(key) {
  case 'a': 
    vizObjectsCir[0]+=grow;
    break;
  case 's': 
    vizObjectsCir[1]+=grow;
    break;
  case 'd': 
    vizObjectsCir[2]+=grow;
    break;
  case 'f': 
    vizObjectsCir[3]+=grow;
    break;
  case 'g': 
    vizObjectsCir[4]+=grow;
    break;
  case 'h': 
    vizObjectsCir[5]+=grow;
    break;
  case 'j': 
    vizObjectsCir[6]+=grow;
    break;
  case 'k': 
    vizObjectsCir[7]+=grow;
    break;
  case 'l': 
    vizObjectsCir[8]+=grow;
    break;
  case ';': 
    vizObjectsCir[9]+=grow;
    break;
  case '0': 
    background(255);
    for (int i=0; i<10; i++) {
      vizObjectsCir[i]=0;
    }
    textSize(80);
    text("How excited are you?", width/2-300, 150);
    x=0;
    for (int i=0; i<10; i++) {
      x+=width/11;
      strokeWeight(3);
      stroke(0, 230);
      fill(0);
      y=height/2;
      textSize(50);
      text(i+1, x, height-100);
    }
    break;
  }
}