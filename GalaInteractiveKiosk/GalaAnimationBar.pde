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