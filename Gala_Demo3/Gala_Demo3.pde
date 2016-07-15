float x=0;
float y=0;
float x2=0;
float y2=0;
float cir=10;

PFont f;

PImage img;  // Declare variable "a" of type PImage
PImage bk;  // Declare variable "a" of type PImage

int vizObjectsCir[]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

int vizObjectsColor[]={10, 30, 60, 90, 120, 140, 160, 180, 200, 230};

void setup() {
  fullScreen();
  background(255);

  img = loadImage("images/ice.png");
  bk = loadImage("images/space.jpg");

  image(bk, 0, 0, bk.width*1.5, bk.height*1.5);

  printArray(PFont.list());
  f = createFont("comic_zine_ot.otf", 80);
  textFont(f);
  fill(255);
  text("I'm this excited for my future?", 100, 150);



  for (int i=0; i<10; i++) {
    x+=width/11;
    strokeWeight(3);
    stroke(0, 230);
    fill(255);
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
    strokeWeight(3);
    stroke(0, 230);
    fill(vizObjectsColor[i], 195, vizObjectsColor[9-i], 30);
    imageMode(CENTER);
    image(img, x+x2, y+y2, vizObjectsCir[i], vizObjectsCir[i]);
    fill(255); 
    textSize(70);
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
    text("How excited are you?", 100, 150);
    x=0;
    for (int i=0; i<10; i++) {
      x+=width/11;
      strokeWeight(3);
      stroke(0, 230);
      fill(255);
      y=height/2;
      textSize(50);
      text(i+1, x, height-100);
    }
    break;
  }
}