
float x=0;
float y=0;
float cir=10;

PFont f;

int vizObjectsCir[]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

int vizObjectsColor[]={10, 30, 60, 90, 120, 140, 160, 180, 200, 230};

void setup() {
  fullScreen();
  background(255);

  printArray(PFont.list());
  f = createFont("EraserRegular.ttf", 80);
  textFont(f);
  fill(0);
  text("Feeling Respect?", width/2-400, 150);

  for (int i=0; i<10; i++) {
    x+=width/11;
    strokeWeight(3);
    stroke(0, 230);
    fill(0);
    y=height/2;
    textSize(50);
    text(i+1, x, 300);
  }
}

void draw() {
  y=height;
  x=0;
  for (int i=0; i<10; i++) {
    x+=width/11;
    fill(vizObjectsColor[i], vizObjectsColor[9-i], 195, 30);
    rectMode(CENTER);
    rect(x, y, 120, vizObjectsCir[i]);
  }
}


void keyPressed() {
  float grow = 30;
  switch(key) {
  case 'a': 
    vizObjectsCir[0]-=grow;
    break;
  case 's': 
    vizObjectsCir[1]-=grow;
    break;
  case 'd': 
    vizObjectsCir[2]-=grow;
    break;
  case 'f': 
    vizObjectsCir[3]-=grow;
    break;
  case 'g': 
    vizObjectsCir[4]-=grow;
    break;
  case 'h': 
    vizObjectsCir[5]-=grow;
    break;
  case 'j': 
    vizObjectsCir[6]-=grow;
    break;
  case 'k': 
    vizObjectsCir[7]-=grow;
    break;
  case 'l': 
    vizObjectsCir[8]-=grow;
    break;
  case ';': 
    vizObjectsCir[9]-=grow;
    break;
  case '0': 
    background(255);
    for (int i=0; i<10; i++) {
      vizObjectsCir[i]=0;
    }
    textSize(80);
    text("How excited are you?", width/2-400, 150);
    x=0;
    for (int i=0; i<10; i++) {
      x+=width/11;
      strokeWeight(3);
      stroke(0, 230);
      fill(0);
      y=height/2;
      textSize(50);
      text(i+1, x, 300);
    }
    break;
  }
}