class GalaAnimation extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question
  private float txtSize = 70; 


  int vizObjectsCir[]={0, 0, 0, 0, 0};
  int vizObjectsColor[]={220, 160, 120, 60, 10};

  GalaAnimation(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255);
    textFont(font);
    fill(0);
    textSize(txtSize);
    text(question, width/2, qEdgeDist);
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

      if (imgOrVec ==0) {                 //visualize vector graphic
        strokeWeight(3);
        stroke(0, 230);
        fill(vizObjectsColor[i], 195, vizObjectsColor[4-i], 30);
        ellipse(x, y, vizObjectsCir[i], vizObjectsCir[i]);
      }
      if (imgOrVec ==1) {                 //visualize with png
        imageMode(CENTER);
        fill(vizObjectsColor[i], 195, vizObjectsColor[4-i], 30);
        image(image, x, y, vizObjectsCir[i], vizObjectsCir[i]);
      }
      fill(0); 
      textSize(txtSize);
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
      for (int i=0; i<5; i++) {
        vizObjectsCir[i]=0;
      }
      textSize(txtSize);
      text(question, width/2, qEdgeDist);
      x=0;
      break;
    }
  }
}