class GalaAnimation extends AbstractAnimation {
  
  float x=0;
  float y=0;
  float cir=10;

  int vizObjectsCir[]={0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  int vizObjectsColor[]={10, 30, 60, 90, 120, 140, 160, 180, 200, 230};
  
   GalaAnimation(PApplet app) {
    super(app);
  } 
  
  public void setup(){
     super.setup();
      background(255);
      textFont(font);
      fill(0);
      text(question, width/2-300, 150);
  
      for (int i=0; i<10; i++) {
        x+=width/11;
        strokeWeight(3);
        stroke(0, 230);
        fill(0);
        y=height/2;
        textSize(50);
        text(i+1, x, height-100);
      }  
  }
  
  public void update(){
  }
  
  
  public void draw(){
    super.draw();
    y=height/2;
    x=0;

    for (int i=0; i<10; i++) 
    {
      x+=width/11;
      pushMatrix();
      strokeWeight(3);
      stroke(0, 230);
      fill(vizObjectsColor[i], 195, vizObjectsColor[9-i], 30);
      popMatrix();
      ellipse(x, y, vizObjectsCir[i], vizObjectsCir[i]);
      fill(0); 
      textSize(70);
      image(image, 20, 40);
    }
  }
  
  public void keyPressed(int key) {
    float grow = 20;
    
    switch(key) {
      case 'a': 
        vizObjectsCir[0]+=grow;
        break;
      case 's': 
        vizObjectsCir[1]+=grow;
        break;
      case 'd': 
        vizObjectsCir[2]+=grow;
        break;
      case 'f': 
        vizObjectsCir[3]+=grow;
        break;
      case 'g': 
        vizObjectsCir[4]+=grow;
        break;
      case 'h': 
        vizObjectsCir[5]+=grow;
        break;
      case 'j': 
        vizObjectsCir[6]+=grow;
        break;
      case 'k': 
        vizObjectsCir[7]+=grow;
        break;
      case 'l': 
        vizObjectsCir[8]+=grow;
        break;
      case ';': 
        vizObjectsCir[9]+=grow;
        break;
      case '0': 
        background(255);
        for (int i=0; i<10; i++) {
          vizObjectsCir[i]=0;
        }
        textSize(80);
          text(question, width/2-300, 150);
        x=0;
        for (int i=0; i<10; i++) {
          x+=width/11;
          strokeWeight(3);
          stroke(0, 230);
          fill(0);
          y=height/2;
          textSize(50);
          text(i+1, x, height-100);
        }
      break;
    }
  }
}