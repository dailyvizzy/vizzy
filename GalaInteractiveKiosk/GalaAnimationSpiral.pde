class GalaAnimationSpiral extends AbstractAnimation {

  private float x=0;
  private float y=0;
  float posx, posy;
  private float cir=10;
  private float txtSize=70;
  private float qEdgeDist = 100;  //y value for question
  
  float spiralAngle = 0;
  float radiusSpiralDots;

  int vizObjectsColor[]={160, 120, 80, 60, 20};
  int tally[]={0, 0, 0, 0, 0};
  float nodeLocX[]={0, 0, 0, 0, 0};
  float nodeLocY[]={0, 0, 0, 0, 0};
  float spiralAngles[] = {0, 0, 0, 0, 0};
  


  GalaAnimationSpiral(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    fullScreen();
    background(255, 240, 255);

    for (int i=0; i<5; i++) 
    {
      nodeLocY[i]=(height/2);
    }
    fill(0);
    textSize(txtSize);
    textFont(font);
    text(question, width/2, qEdgeDist);
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    background(255, 240, 255);
    fill(0);
    
    x=100;
    for (int j=0; j<5; j++) 
    {
      x+=(width/7);
      nodeLocX[j]=x;
      strokeWeight(3);
      stroke(vizObjectsColor[4-j], vizObjectsColor[j], 170, 255);
      fill(255, 240, 255, 40);
      ellipse(x, nodeLocY[j], 50, 50);
      fill(vizObjectsColor[4-j], vizObjectsColor[j], 170, 255);
      textSize(txtSize/3);
      if (tally[j]>0) {
        text(tally[j], x, nodeLocY[j]-2);
      }
    }
    
    
    for (int i=0; i<5; i++)
    {
      pushMatrix();
      smooth();
      radiusSpiralDots=25;
      //spiralAngles[0]+=0.25;
      
      stroke(vizObjectsColor[4-i], vizObjectsColor[i], 170, 255);
      strokeWeight(1);
     
      translate(nodeLocX[i], nodeLocY[i]);
     
      for(float angle = 0; angle < spiralAngles[i]*PI; angle += .1){
        radiusSpiralDots += 0.5;
        posx = cos(angle) * radiusSpiralDots;
        posy = sin(angle) * radiusSpiralDots;
        //point(posx, posy);
        fill(vizObjectsColor[4-i], vizObjectsColor[i], 170, 255);
        ellipse(posx, posy, 4, 4);
      }
      
      float px = -999;
      float py = -999;
      float radiusSpiralLine = 25;
      stroke(vizObjectsColor[4-i], vizObjectsColor[i], 170, 255);
      strokeWeight(2);
      for(float angle = 0; angle < spiralAngles[i]*PI; angle += .05){
        radiusSpiralLine += 0.25;
        posx = cos(angle) * radiusSpiralLine;
        posy = sin(angle) * radiusSpiralLine;
        if(px > -999){
          line(posx, posy, px, py);
        }
        px = posx;
        py = posy;
      }
      popMatrix();
    }
     
     fill(0);
    textSize(txtSize);
    textFont(font);
    text(question, width/2, qEdgeDist);

  }

  public void keyPressed(int key) {
    
    switch(key) {
    case '1': 
      //radiusSpiralDots=10;
      spiralAngles[0]+=0.25;
      //stroke(vizObjectsColor[4], vizObjectsColor[0], 170, 255);
      //strokeWeight(5);
      //translate(nodeLocX[0], nodeLocY[0]);
      //for(float angle = 0; angle < spiralAngles[0]*PI; angle += .2){
      //  radiusSpiralDots += 0.5;
      //  x = cos(angle) * radiusSpiralDots;
      //  y = sin(angle) * radiusSpiralDots;
      //  point(x, y);
      //}
      
      //float px = -999;
      //float py = -999;
      //float radiusSpiralLine = 10;
      //stroke(vizObjectsColor[4], vizObjectsColor[0], 170, 255);
      //strokeWeight(1);
      //for(float angle = 0; angle < spiralAngles[0]*PI; angle += .1){
      //  radiusSpiralLine += 0.25;
      //  x = cos(angle) * radiusSpiralLine;
      //  y = sin(angle) * radiusSpiralLine;
      //  if(px > -999){
      //    line(x, y, px, py);
      //  }
      //  px = x;
      //  py = y;
      //}
      tally[0]++;
      break;
    case '2': 
      spiralAngles[1]+=0.25;
      tally[1]++;
      break;
    case '3': 
      spiralAngles[2]+=0.25;
      tally[2]++;
      break;
    case '4': 
      spiralAngles[3]+=0.25;
      tally[3]++;
      break;
    case '5': 
      spiralAngles[4]+=0.25;
      tally[4]++;
      break;
    case '0':                    //clear animation and provide new question
      if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
        saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
      }
      for (int i=0; i<5; i++) {
        tally[i]=0;
      }
      textSize(txtSize);
      x=0;
      fill(255, 240, 255, 40);
      for (int i=0; i<5; i++) 
      {
        nodeLocY[i]=(height/2);
      }
      background(255, 240, 255);
      fill(0);
      text(question, width/2, qEdgeDist);
      break;
    }
  }
}