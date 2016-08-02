class GalaAnimationCircles extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question
  private float txtSize = 100;
  private float rectHeight=10;    //used for rect height
  private float rectWide=220;    //used for rect height
  
  int xspacing = 16;   // How far apart should each horizontal location be spaced

  float theta = 0.0;  // Start angle at 0  
  float amplitude = 7.0;  // Height of wave
  float period = 500.0;  // How many pixels before the wave repeats
  float dx;  // Value for incrementing X, a function of period and xspacing
  float[] yvalues;  // Using an array to store height values for the wave
  
  int ampVal[]={10,10,10,10,10};
  int vizObjectsColor[]={10, 60, 120, 160, 200};
  int yPositions[]={300, 400, 500, 600, 700};

  GalaAnimationCircles(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255);
    textFont(font);
    fill(0);
    textSize(txtSize);  
    
   
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
    
    
  }
 

public void draw() {
    super.draw();
   
    background(255);
    
    calcWave();
    renderWave();
    
    fill(0);
    text(question, width/2, qEdgeDist);

    //if (isTextBiggerThanTheScreen()) {
    //  println("Fixedddd!!!!");
    //} 
    
    //if (isTextSoTiny()){
    //  println("Fixedddd!!!!");
    //}
  }
  
  void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;
    
  // For every x value, calculate a y value with sine function
      for (int i=0; i<5; i++) 
    { 
      float x = theta;
      for (int j = 0; j < yvalues.length; j++) {
        //println(ampVal[i]);
        yvalues[j] = sin(x)*amplitude;
        x+=dx;
      }
    }
}

void renderWave() {
  
   for (int i=0; i<5; i++) 
    {
      strokeWeight(2);
      fill(vizObjectsColor[i], vizObjectsColor[4-i], 195, 30);
      stroke(0);
      // A simple way to draw the wave with an ellipse at each location
      for (int x = 0; x < yvalues.length; x++) {
        ellipse(x*xspacing, yPositions[i]+yvalues[x], 15, 15);
      }
      
    }
}
  
  private Boolean isTextBiggerThanTheScreen(){
    
    if (textWidth(question) > w - 100) {
      textSize(txtSize--);
      println(txtSize);
      background(200);
      fill(0);
      text(question, width/2, qEdgeDist);
      isTextBiggerThanTheScreen();
      return true;
    } else return false;
   
  }
  
   private Boolean isTextSoTiny(){
    
    if (textWidth(question) < w - 100) {
      textSize(txtSize++);
      println(txtSize);
      background(200);
      fill(0);
      text(question, width/2, qEdgeDist);
      isTextSoTiny();
      return true;
    } else return false;
   
  }

  public void keyPressed(int key) {
     int amp = 2;

    switch(key) {
    case '1': 
      amplitude=+amp; 
      break;
    case '2': 
      amplitude=+amp;
      break;
    case '3': 
      amplitude=+amp;
      break;
    case '4': 
      amplitude=+amp;
      break;
    case '5':
      amplitude=+amp;
      break;
    }
  }
}