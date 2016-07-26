class GalaAnimationBar extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float numSize = 100;   //size of numbers
  private float qEdgeDist = 150;  //y value for question
  private float numEdgeDist = 110; //y value for numbers
  private float txtSize = 70;

  int vizObjectsCir[]={0, 0, 0, 0, 0};
  int vizObjectsColor[]={220, 160, 120, 60, 10};

  GalaAnimationBar(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255);
    textFont(font);
    fill(0);
    textSize(txtSize);
    text(question, width/2, qEdgeDist);

    for (int i=0; i<5; i++) {
      x+=width/6;
      strokeWeight(3);
      stroke(0, 230);
      fill(0);
      y=height/2;
      text(i+1, x, height-numEdgeDist);
    }
    textSize(txtSize/2.1);
    text("Disagree", numEdgeDist, (height-numEdgeDist)+2);
    text("Agree", width-numEdgeDist, (height-numEdgeDist)+2);
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    y=height/2;
    x=0;

    for (int i=0; i<5; i++) 
    {
      x+=width/6;
      pushMatrix();
      strokeWeight(3);
      stroke(0, 230);
      fill(vizObjectsColor[i], 195, vizObjectsColor[4-i], 30);
      popMatrix();
      ellipse(x, y, vizObjectsCir[i], vizObjectsCir[i]);
      fill(0); 
      textSize(txtSize);
      //image(image, 20, 40);
    }
  }

  public void keyPressed(int key) {
    float grow = 20;

    switch(key) {
    case '1': 
      vizObjectsCir[0]+=grow;
      break;
    case '2': 
      vizObjectsCir[1]+=grow;
      break;
    case '3': 
      vizObjectsCir[2]+=grow;
      break;
    case '4': 
      vizObjectsCir[3]+=grow;
      break;
    case '5': 
      vizObjectsCir[4]+=grow;
      break;
    case '0':                    //clear animation and provide new question
      background(255);
      for (int i=0; i<10; i++) {
        vizObjectsCir[i]=0;
      }
      textSize(txtSize);
      text(question, width/2, qEdgeDist);
      x=0;
      for (int i=0; i<5; i++) {
        x+=width/6;
        strokeWeight(3);
        stroke(0, 230);
        fill(0);
        y=height/2;
        textSize(txtSize);
        text(i+1, x, height-numEdgeDist);
      }
      break;
    }
  }
}