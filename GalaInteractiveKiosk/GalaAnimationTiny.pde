class GalaAnimationTiny extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question 
  private float txtSize = 70;


  int vizObjectLocX[]={0, 0, 0, 0, 0};
  int vizObjectLocY[]={0, 0, 0, 0, 0};
  int vizObjectC[]={100, 130, 180, 200, 240};

  GalaAnimationTiny(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255);
    y=height-70;
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    x=-50;

    for (int i=0; i<5; i++) 
    {
      x+=(width/6);

      if (imgOrVec == 0) {                 //visualize vector graphic
        stroke(vizObjectC[i]-80, 20, 150, 255);
        strokeWeight(5);
        fill(vizObjectC[i], 50, 190, 255);
        rectMode(CENTER);
        rect(x+vizObjectLocX[i], y+vizObjectLocY[i], 30, 30);
      }
      if (imgOrVec == 1) {                 //visualize with png
        imageMode(CENTER);
        image(image, x+vizObjectLocX[i], y+vizObjectLocY[i], 30, 30);
      }
    }
    fill(0);
    text(question, width/2, qEdgeDist);
  }

  public void keyPressed(int key) {
    switch(key) {
    case '1': 
      vizObjectLocX[0]+=35;
      if (vizObjectLocX[0]>150) {
        vizObjectLocX[0]=0;
        vizObjectLocY[0]-=35;
      }
      break;
    case '2':
      vizObjectLocX[1]+=35;
      if (vizObjectLocX[1]>150) {
        vizObjectLocX[1]=0;
        vizObjectLocY[1]-=35;
      }
      break;
    case '3':
      vizObjectLocX[2]+=35;
      if (vizObjectLocX[2]>150) {
        vizObjectLocX[2]=0;
        vizObjectLocY[2]-=35;
      }
      break;
    case '4': 
      vizObjectLocX[3]+=35;
      if (vizObjectLocX[3]>150) {
        vizObjectLocX[3]=0;
        vizObjectLocY[3]-=35;
      }
      break;
    case '5': 
      vizObjectLocX[4]+=35;
      if (vizObjectLocX[4]>150) {
        vizObjectLocX[4]=0;
        vizObjectLocY[4]-=35;
      }
      break;
    case '0':
      x=-50;
      y=height-70;
      for (int i=0; i<5; i++) {
        vizObjectLocX[i]=0;
        vizObjectLocY[i]=0;
      }
      background(255);
      fill(0);
      textSize(txtSize);
      text("hello friends", width/2, qEdgeDist);
      imgOrVec = (int)random(2);
      break;
    }
  }
}