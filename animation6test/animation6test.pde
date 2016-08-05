PImage tex;
float x=0;
float y=0;
float txtSize=70;
float qEdgeDist = 100;  //y value for question 
int imgOrVec;

float rotx = PI/4;
float roty = PI/4;

PFont font;

int tally[]={0, 0, 0, 0, 0};
float rotX[]={0, 0, 0, 0, 0};
float rotY[]={0, 0, 0, 0, 0};
float size[]={0, 0, 0, 0, 0};

void setup() {
  fullScreen(P3D);
  background(255, 240, 255);
  textAlign(CENTER, CENTER);
  textureMode(NORMAL);
  tex = loadImage("Goat-PNG-Clipart.png");
  imgOrVec = 0;
}

void draw() {
  //textFont(font);
  textSize(txtSize);

  x=0;
  background(240, 250, 230, 0);
  for (int i=200; i<width+200; i+=10) {
    fill(0);
    stroke(0, 60);
    strokeWeight(1);
    line(0, i, width, i);
    line(i-200, 200, i-200, height);
  }
  noStroke();

  for (int i=0; i<5; i++) 
  {
    if (imgOrVec == 0) { 
      pushMatrix();
      x+=(width/6);
      translate(x, height/2.0, 0);
      rotateX(rotX[i]);
      rotateY(rotY[i]);
      scale(size[i]*2);
      strokeWeight(.01);
      stroke(0);
      TexturedCube(tex);
      popMatrix();
      if (tally[i]>0) {
        textSize(txtSize/4);
        text(tally[i], x, (height/2.0)+(size[i]*3.5));
      }
    }
    if (imgOrVec == 1) { 
      pushMatrix();
      x+=(width/6);
      translate(x, height/2.0, 0);
      rotateX(rotX[i]);
      rotateY(rotY[i]);
      scale(size[i]);
      noStroke();
      fill(255, 126, 180);
      pointLight(x, 100, 126, 10, 40, x);
      box(size[i]/6);
      popMatrix();
      if (tally[i]>0) {
        textSize(txtSize/4);
        text(tally[i], x, (height/2.0)+(size[i]*6));
      }
    }
  }

  for (int i = 0; i<5; i++) {
    rotX[i]+=0.001;
    rotY[i]+=.02;
  }
  fill(0);
  textSize(txtSize);
  text("Last Weekend was fun!!!", width/2, qEdgeDist);
}
void keyPressed() {

  switch(key) {
  case '1': 
    size[0]+=1;
    tally[0]++;
    break;
  case '2': 
    size[1]+=1;
    tally[1]++;
    break;
  case '3': 
    size[2]+=1;
    tally[2]++;
    break;
  case '4': 
    size[3]+=1;
    tally[3]++;
    break;
  case '5': 
    size[4]+=1;
    tally[4]++;
    break;
  case '0':                    //clear animation and provide new question
    if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
      //saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
    }
    for (int i=0; i<5; i++) {
      size[i]=0;
      tally[i]=0;
    }
    x=0;
    fill(255, 240, 255, 40);
    background(255, 240, 255);
    fill(0);
    textSize(txtSize);
    text("are you feeling funky?", width/2, qEdgeDist);
    break;
  }
}

void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);

  // +Z "front" face
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex( 1, 1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1, 1, 1, 0, 0);
  vertex( 1, 1, 1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);

  // +X "right" face
  vertex( 1, -1, 1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex( 1, 1, 1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  endShape();
}