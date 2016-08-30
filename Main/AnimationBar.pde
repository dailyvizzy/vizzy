class AnimationBar extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y

  int vizGrowth[]={0, 0, 0, 0, 0};
  int vizObjectsColor[]={10, 60, 120, 160, 200};
  int tally[]={0, 0, 0, 0, 0};

  AnimationBar(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255);
    renderText();
    boxy();
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
        strokeWeight(2);
        fill(vizObjectsColor[i], vizObjectsColor[4-i], 195, 30);
        stroke(0);
        rectMode(CENTER);
        rect(x, y, 230, vizGrowth[i]);
        if (tally[i]>0) {
          fill(255, 60);
          stroke(0);
          ellipse(x, height-65, 40, 40);
          fill(0);
          textSize(txtSize/2.5);
          text(tally[i], x, height-70);
        }
      }
      if (imgOrVec == 1) {                 //visualize with png
        strokeWeight(2);
        imageMode(CENTER);
        fill(vizObjectsColor[i], 195, vizObjectsColor[4-i], 30);
        image(image, x, y+vizGrowth[i], image.width/2.5, image.height/2.5);
        if (tally[i]>0) {
          fill(255, 60);
          stroke(0);
          ellipse(x, height-65, 40, 40);
          fill(0);
          textSize(txtSize/2.5);
          text(tally[i], x, height-70);
        }
      }
    }
    renderText();
  }

  public void keyPressed(int key) {
    float grow = 20;

    switch(key) {
    case '1': 
      vizGrowth[0]-=grow;
      tally[0]++;
      break;
    case '2': 
      vizGrowth[1]-=grow;
      tally[1]++;
      break;
    case '3': 
      vizGrowth[2]-=grow;
      tally[2]++;
      break;
    case '4': 
      vizGrowth[3]-=grow;
      tally[3]++;
      break;
    case '5': 
      vizGrowth[4]-=grow;
      tally[4]++;
      break;
    case '0':
      if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
        super.saveVizImg();
      }
      for (int i=0; i<5; i++) {
        vizGrowth[i]=0;
        tally[i]=0;
      }
    
      renderText();
      break;
    }
  }
}