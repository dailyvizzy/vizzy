float x=0;
float y=0;
float x2=0;
float y2=0;
float cir=10;

PFont f;

PImage img;  // Declare variable "a" of type PImage
PImage bk;  // Declare variable "a" of type PImage

int vizObjectsCir[]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

int vizObjectsLoc[]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

import ddf.minim.*;

AudioSample sound;

Minim minim;
AudioPlayer player;

void setup() {
  fullScreen();
  background(255);

  minim = new Minim(this);
  sound = minim.loadSample( "gas.wav", 512);

  img = loadImage("images/ice.png");
  bk = loadImage("images/space.jpg");

  image(bk, 0, 0, bk.width*1.5, bk.height*1.5);

  printArray(PFont.list());
  f = createFont("comic_zine_ot.otf", 80);
  textFont(f);
  fill(255);
  text("I'm excited for my future?", 100, 150);



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
    imageMode(CENTER);
    image(img, x, y+vizObjectsLoc[i], vizObjectsCir[i], vizObjectsCir[i]);
    fill(255); 
    textSize(70);
  }
}


void keyPressed() {
  float grow = 20;
  switch(key) {
  case 'a': 
    vizObjectsCir[0]+=grow;
    vizObjectsLoc[0]+=20;
    break;
  case 's': 
    vizObjectsCir[1]+=grow;
    vizObjectsLoc[1]-=20;
    break;
  case 'd': 
    vizObjectsCir[2]+=grow;
    vizObjectsLoc[2]+=20;
    break;
  case 'f': 
    vizObjectsCir[3]+=grow;
    vizObjectsLoc[3]-=20;
    break;
  case 'g': 
    vizObjectsCir[4]+=grow;
    vizObjectsLoc[4]+=20;
    break;
  case 'h': 
    vizObjectsCir[5]+=grow;
    vizObjectsLoc[5]-=20;
    break;
  case 'j': 
    vizObjectsCir[6]+=grow;
    vizObjectsLoc[6]+=20;
    break;
  case 'k': 
    vizObjectsCir[7]+=grow;
    vizObjectsLoc[7]-=20;
    break;
  case 'l': 
    vizObjectsCir[8]+=grow;
    vizObjectsLoc[8]+=20;
    break;
  case ';': 
    vizObjectsCir[9]+=grow;
    vizObjectsLoc[9]-=20;
    break;
  case '0': 
    background(255);
    for (int i=0; i<10; i++) {
      vizObjectsCir[i]=0;
    }
    textSize(80);
    text("I'm excited for my future?", 100, 150);
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
  sound.trigger();
}