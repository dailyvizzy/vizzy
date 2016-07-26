class GalaAnimationBar extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question
  private float txtSize = 70;
  private float rectHeight=10;    //used for rect height
  private float rectWide=220;    //used for rect height

  int vizGrowth[]={0, 0, 0, 0, 0};
  int vizObjectsColor[]={10, 60, 120, 160, 200};

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
    textSize(txtSize/2.1);
  }

  public void update() {
  }

  public void draw() {
    super.draw();
    y=height/2;
    x=0;

    y=height;
    x=0;
    for (int i=0; i<5; i++) {
      x+=width/6;
      fill(vizObjectsColor[i], vizObjectsColor[4-i], 195, 30);
      rectMode(CENTER);
      rect(x, y, 230, vizGrowth[i]);
    }
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
      text(question, width/2, qEdgeDist);
      x=0;
      break;
    }
  }
}