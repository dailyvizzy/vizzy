class GalaAnimationCubes extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 100;  //y value for question 
  private float rotx = PI/4;
  private float roty = PI/4;

  int tally[]={0, 0, 0, 0, 0};
  float rotX[]={0, 0, 0, 0, 0};
  float rotY[]={0, 0, 0, 0, 0};
  float size[]={0, 0, 0, 0, 0};

  GalaAnimationCubes(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    renderText();
    textureMode(NORMAL);
  }

  public void update() {
  }


  public void draw() {
    super.draw();

    textSize(txtSize);

    x=0;
    background(240, 250, 230, 0);
    for (int i=0; i<width+200; i+=10) {
      fill(0);
      stroke(0, 60);
      strokeWeight(1);
      line(0, i, width, i);
      line(i, 0, i, height);
    }
    noStroke();

    for (int i=0; i<5; i++) 
    { 
      pushMatrix();
      x+=(width/6);
      translate(x, height/2.0, 0);
      rotateX(rotX[i]);
      rotateY(rotY[i]);
      scale(size[i]*2.5);
      strokeWeight(.01);
      stroke(0);
      TexturedCube(image);
      popMatrix();
      if (tally[i]>0) {
        textSize(txtSize/4);
        text(tally[i], x, (height/2.0)+(size[i]*4.5));
      }

      for (int j = 0; j<5; j+=2) {
        rotX[j]+=0.001;
        rotY[j]+=0.001;
      }
      for (int j = 1; j<4; j+=2) {
        rotX[j]-=0.001;
        rotY[j]-=0.001;
      }
      fill(0);
      renderText();
    }
  }

  public void keyPressed(int key) {

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
      renderText();
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
}