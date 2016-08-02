import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Calendar; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GalaInteractiveKiosk extends PApplet {

/*todo
 --> More Animations: one with sine waves that change amplitude -->could one be a series of spirals? --> perlin noise splatter patterns
 --> collect really subtle background images? - Andrew and Javi
 --> need to hook up and test arduino with buttons
 --> individual animations code could be cleaned up 
 --> White strip to see text question - Javi
*/


AnimationsManager animationsManager;
FontsManager fontsManager;
ImagesManager imagesManager;
QuestionsManager questionsManager;

AbstractAnimation dailyAnimation;


public void setup () {

  noCursor();
  
  
  frameRate(60);
  textAlign(CENTER, CENTER);

  animationsManager = new AnimationsManager(this);
  fontsManager = new FontsManager();
  imagesManager = new ImagesManager();
  questionsManager = new QuestionsManager();

  animationsManager.initAnimations();
  getRandomElements();
}

public void getRandomElements() {

  dailyAnimation = animationsManager.getRandomAnimation();
  dailyAnimation.font = fontsManager.getRandomFont();
  dailyAnimation.image = imagesManager.getRandomPNG();
  dailyAnimation.background = imagesManager.getRandomBack();
  dailyAnimation.question = questionsManager.getCurrentQuestion();
  dailyAnimation.imgOrVec = (int)random(2);

  dailyAnimation.setup();
}

public void draw() {
  if (dailyAnimation != null) dailyAnimation.draw();
}

public void update() {
  if (dailyAnimation != null) dailyAnimation.update();
}

public void keyPressed () {

  if (dailyAnimation != null)
  {
    dailyAnimation.keyPressed(key);
    switch(key) {
    case '0': 
      getRandomElements();
      break;
    }
  }
}
public class AbstractAnimation {

  PApplet app;
  PGraphics canvas;

  String question;
  PFont font;
  PImage image;
  PImage background;
  int imgOrVec;
  int w, h;

  AbstractAnimation (PApplet app) 
  {
    this.app = app;
    imgOrVec = 0;
    size(width, height);
  }

  public void size(int w, int h) 
  { 
    println(getName());
    println(w);
    println(h);
    this.w = w;
    this.h = h;
  }

  public void setup() {
  }

  public void update() {
  }


  public void draw() {
  }

  public void keyPressed(int key) {
  }

  public String getName() {
    return this.getClass().getSimpleName();
  }

  public String timestamp() {
    Calendar now = Calendar.getInstance();
    return String.format("%1$th-%1$td-%1$ty_%1$tH%1$tM%1$tS", now);
  }
}
class AnimationsManager {

  PApplet app;

  ArrayList<AbstractAnimation> anims;
  AbstractAnimation currentAnim;

  int animIndex = 0;

  AnimationsManager(PApplet app) {
    this.app = app;
  } 

  public void initAnimations () {

    anims = new ArrayList<AbstractAnimation>();
    anims.add( new GalaAnimation(app));
    anims.add( new GalaAnimationBar(app));
    anims.add( new GalaAnimationTiny(app));
    anims.add( new GalaAnimationAntenna(app));
    anims.add( new GalaAnimationMoire(app));
    

    //setAnimation((int)random(anims.size()));
    //currentAnim = anims.get(animIndex);
  }

  public void setAnimation(int index)
  {
    animIndex = index;
    currentAnim = anims.get(animIndex);
  }

  public AbstractAnimation getRandomAnimation() {
    int random = (int)random(anims.size());
    setAnimation(random);
    return currentAnim;
  }

  public void keyPressed(int key) { 
    currentAnim.keyPressed(key);
  }
}
class FontsManager {
  
  String path; 
  File fontDir;
  //File[] fontFiles;
  String[] fontFileNames;
  
  PFont font;  //font object
  float randFont; //font randomizer


  FontsManager() {
    path = dataPath("fonts");
    File fontDir = new File(path);
    fontFileNames = fontDir.list();
    println(fontFileNames);
    
    /* TODO; Better filter de Array to avoid .DS_Store*/
    /*fontFiles = fontDir.listFiles(new FilenameFilter() {
        @Override
        public boolean accept(File dir, String name) {
            return !name.equals(".DS_Store");
        }
    });*/
  } 
  
  public PFont getRandomFont(){
    
    String fontName;
    randFont = random((int)fontFileNames.length);
    fontName = fontFileNames[(int)randFont];
    
    if (fontName.equals(".DS_Store")){
      randFont = random((int)fontFileNames.length);
      fontName = fontFileNames[(int)randFont];
      println("FONT .DS_STORE SKIPPED!!!!");
    }
    
    font = createFont(path+"/"+fontName, 60);
    println("currentfont" + " " + fontName);   //see randomly choosen font
    return font;
  }
    
}
class GalaAnimation extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question 
  private float txtSize = 70;


  int vizObjectsCir[]={0, 0, 0, 0, 0};
  int vizObjectsColor[]={220, 160, 120, 60, 10};
  int tally[]={0, 0, 0, 0, 0};

  //int txtSize[] = {20,40,60,80,100};

  GalaAnimation(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255);
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    //background(background);
    background(255);
    textFont(font);
    textSize(txtSize);
    fill(0);

    y=height/2;
    x=0;

    for (int i=0; i<5; i++) 
    {
      x+=width/6;

      if (imgOrVec == 0) {                 //visualize vector graphic
        strokeWeight(3);
        stroke(0, 230);
        fill(vizObjectsColor[i], 195, vizObjectsColor[4-i], 150);
        ellipse(x, y, vizObjectsCir[i], vizObjectsCir[i]);
        fill(0);
        textSize(txtSize/3);
        if (tally[i]>0) {
          text(tally[i], x, (y+15)+(vizObjectsCir[i]/2));
        }
      }
      if (imgOrVec == 1) {                 //visualize with png
        imageMode(CENTER);
        fill(255, 127);
        if (tally[i]>0) {
          strokeWeight(3);
          stroke(1);
          //ellipse(x, y, vizObjectsCir[i]+7, vizObjectsCir[i]+7);
          image(image, x, y, vizObjectsCir[i], vizObjectsCir[i]);
          fill(0);
          textSize(txtSize/3);

          text(tally[i], x, (y+15)+(vizObjectsCir[i]/2));
        }
      }
      fill(0);
      textSize(txtSize);
      text(question, width/2, qEdgeDist);
    }
  }

  public void keyPressed(int key) {
    float grow = 20;

    switch(key) {
    case '1': 
      vizObjectsCir[0]+=grow;
      tally[0]++;
      break;
    case '2': 
      vizObjectsCir[1]+=grow;
      tally[1]++;
      break;
    case '3': 
      vizObjectsCir[2]+=grow;
      tally[2]++;
      break;
    case '4': 
      vizObjectsCir[3]+=grow;
      tally[3]++;
      break;
    case '5': 
      vizObjectsCir[4]+=grow;
      tally[4]++;
      break;
    case '0':                    //clear animation and provide new question
      if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
        saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
      }
      for (int i=0; i<5; i++) {
        vizObjectsCir[i]=0;
        tally[i]=0;
      }
      textSize(txtSize);
      text(question, width/2, qEdgeDist);
      x=0;
      background(255);
      break;
    }
  }
}
class GalaAnimationAntenna extends AbstractAnimation {

  private float x=0;
  private float y=0;
  private float cir=10;
  private float txtSize=70;
  private float qEdgeDist = 100;  //y value for question 

  int vizObjectsColor[]={160, 120, 80, 60, 20};
  int tally[]={0, 0, 0, 0, 0};
  float nodeLocX[]={0, 0, 0, 0, 0};
  float nodeLocY[]={0, 0, 0, 0, 0};



  GalaAnimationAntenna(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    fullScreen();
    background(255, 240, 255);

    for (int i=0; i<5; i++) 
    {
      nodeLocY[i]=(height/2) + random(-100, 300);
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
    x=100;

    for (int i=0; i<5; i++) 
    {
      x+=(width/7);
      nodeLocX[i]=x;
      strokeWeight(3);
      stroke(vizObjectsColor[4-i], vizObjectsColor[i], 170, 255);
      fill(255, 240, 255, 40);
      ellipse(x, nodeLocY[i], 50, 50);
      fill(vizObjectsColor[4-i], vizObjectsColor[i], 170, 255);
      textSize(txtSize/2);
      if (tally[i]>0) {
        text(tally[i], x, nodeLocY[i]-2);
      }
    }
  }

  public void keyPressed(int key) {
    float antennaX = random(-280, 280);
    float antennaY = random(-280, 280);

    switch(key) {
    case '1': 
      stroke(vizObjectsColor[4], vizObjectsColor[0], 170, 255);
      fill(vizObjectsColor[4], vizObjectsColor[0], 170, 150);
      line(nodeLocX[0], nodeLocY[0], nodeLocX[0]+antennaX, nodeLocY[0]+antennaY);
      ellipse(nodeLocX[0]+antennaX, nodeLocY[0]+antennaY, 10, 10);
      tally[0]++;
      break;
    case '2': 
      stroke(vizObjectsColor[3], vizObjectsColor[1], 170, 255);
      fill(vizObjectsColor[3], vizObjectsColor[1], 170, 150);
      line(nodeLocX[1], nodeLocY[1], nodeLocX[1]+antennaX, nodeLocY[1]+antennaY);
      ellipse(nodeLocX[1]+antennaX, nodeLocY[1]+antennaY, 10, 10);
      tally[1]++;
      break;
    case '3': 
      stroke(vizObjectsColor[2], vizObjectsColor[2], 170, 255);
      fill(vizObjectsColor[2], vizObjectsColor[2], 170, 150);
      line(nodeLocX[2], nodeLocY[2], nodeLocX[2]+antennaX, nodeLocY[2]+antennaY);
      ellipse(nodeLocX[2]+antennaX, nodeLocY[2]+antennaY, 10, 10);
      tally[2]++;
      break;
    case '4': 
      stroke(vizObjectsColor[1], vizObjectsColor[3], 170, 255);
      fill(vizObjectsColor[1], vizObjectsColor[3], 170, 150);
      line(nodeLocX[3], nodeLocY[3], nodeLocX[3]+antennaX, nodeLocY[3]+antennaY);
      ellipse(nodeLocX[3]+antennaX, nodeLocY[3]+antennaY, 10, 10);
      tally[3]++;
      break;
    case '5': 
      stroke(vizObjectsColor[0], vizObjectsColor[4], 170, 255);
      fill(vizObjectsColor[0], vizObjectsColor[4], 170, 150);
      line(nodeLocX[4], nodeLocY[4], nodeLocX[4]+antennaX, nodeLocY[4]+antennaY);
      ellipse(nodeLocX[4]+antennaX, nodeLocY[4]+antennaY, 10, 10);
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
        nodeLocY[i]=(height/2) + random(-100, 300);
      }
      background(255, 240, 255);
      fill(0);
      text(question, width/2, qEdgeDist);
      break;
    }
  }
}
class GalaAnimationBar extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question
  private float txtSize = 70;
  private float rectHeight=10;    //used for rect height
  private float rectWide=220;    //used for rect height

  int vizGrowth[]={0, 0, 0, 0, 0};
  int vizObjectsColor[]={10, 60, 120, 160, 200};
  int tally[]={0, 0, 0, 0, 0};

  GalaAnimationBar(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255);
    textFont(font);
    fill(0);
    textSize(txtSize);
    background(255);
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
          ellipse(x, height-62, 50, 50);
          fill(0);
          textSize(txtSize/2);
          text(tally[i], x, height-70);
        }
      }
      if (imgOrVec == 1) {                 //visualize with png
        strokeWeight(2);
        imageMode(CENTER);
        fill(vizObjectsColor[i], 195, vizObjectsColor[4-i], 30);
        image(image, x, y+vizGrowth[i], image.width/2.5f, image.height/2.5f);
        if (tally[i]>0) {
          fill(255, 60);
          stroke(0);
          ellipse(x, height-62, 50, 50);
          fill(0);
          textSize(txtSize/2);
          text(tally[i], x, height-70);
        }
      }
    }
    fill(0);
    textSize(txtSize);
    text(question, width/2, qEdgeDist);
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
        saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
      }
      for (int i=0; i<5; i++) {
        vizGrowth[i]=0;
        tally[i]=0;
      }
      fill(0);
      textSize(txtSize);
      text(question, width/2, qEdgeDist);
      background(255);
      x=0;
      break;
    }
  }
}
class GalaAnimationMoire extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question 
  private float txtSize = 70;


  float nodeLocX[]={0, 0, 0, 0, 0};
  float nodeLocY[]={0, 0, 0, 0, 0};
  float totalPoly[]={0, 0, 0, 0, 0};
  float vizObjectsColor[]={0, 0, 0, 0, 0};
  int tally[]={0, 0, 0, 0, 0};

  GalaAnimationMoire(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    background(255, 240, 255);
    for (int i=0; i<5; i++) 
    {
      nodeLocY[i]=(height/2) + random(-100, 300);
      vizObjectsColor[i] = random(0, 255);
    }
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    //background(background);
    background(255);
    textFont(font);
    textSize(txtSize);
    x=100;
    background(255, 255, 190);

    for (int i=0; i<5; i++) 
    {
      x+=(width/7);
      nodeLocX[i]=x;
      nodeLocY[i]=height/2;
      pushMatrix();
      translate(x, nodeLocY[i]);
      rotate(frameCount / -100.0f);
      noFill();
      for (int j=0; j<totalPoly[i]; j++) {
        strokeWeight(2);
        stroke(vizObjectsColor[4-i], vizObjectsColor[i], 100);
        polygon(0, 0, (j*6)+20, 7);  // Heptagon
      }
      popMatrix();
    }
    x=100;
    for (int i=0; i<5; i++) 
    {
      x+=(width/7);
      nodeLocX[i]=x;
      textSize(txtSize/5);
      if (tally[i]>0) {
        stroke(vizObjectsColor[4-i], vizObjectsColor[i], 100);
        fill(255);
        ellipse(x, nodeLocY[i], 30, 30);
        fill(0);
        text(tally[i], x, nodeLocY[i]);
      }
      textSize(txtSize);
      fill(0);
      text(question, width/2, qEdgeDist);
    }
  }
  public void keyPressed(int key) {
    float grow = 20;

    switch(key) {
    case '1': 
      totalPoly[0]++;
      tally[0]++;
      break;
    case '2': 
      totalPoly[1]++;
      tally[1]++;
      break;
    case '3': 
      totalPoly[2]++;
      tally[2]++;
      break;
    case '4': 
      totalPoly[3]++;
      tally[3]++;
      break;
    case '5': 
      totalPoly[4]++;
      tally[4]++;
      break;
    case '0':                    //clear animation and provide new question
      if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
        saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
      }
      for (int i=0; i<5; i++) {
        totalPoly[i]=0;
        tally[i]=0;
      }
      x=0;
      fill(255, 240, 255, 40);
      for (int i=0; i<5; i++) 
      {
        nodeLocY[i]=(height/2) + random(-100, 300);
      }
      background(255, 240, 255);
      fill(0);
      textSize(txtSize);
      text(question, width/2, qEdgeDist);
      break;
    }
  }

  public void polygon(float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
class GalaAnimationTiny extends AbstractAnimation {

  private float x=0; 
  private float y=0;   //general x and y
  private float qEdgeDist = 150;  //y value for question 
  private float txtSize = 70;
  private float objSize = 50;
  private float objSpace = 50;

  int vizObjectLocX[]={0, 0, 0, 0, 0};
  int vizObjectLocY[]={0, 0, 0, 0, 0};
  int vizObjectC[]={100, 130, 180, 200, 240};
  float grad[]={20, 50, 70, 90, 100};
  float gradReset[]={20, 50, 70, 90, 100};
  float shape[]={0, 0, 0, 0, 0};
  int tally[]={0, 0, 0, 0, 0};



  GalaAnimationTiny(PApplet app) {
    super(app);
  } 

  public void setup() {
    super.setup();
    textFont(font);
    background(255);
    textSize(txtSize);
    x=0;
    y=height-40;
    strokeWeight(8);
    stroke(0, 30);
  }

  public void update() {
  }


  public void draw() {
    super.draw();
    
    x=-100;

    for (int i=0; i<5; i++) 
    {
      x+=(width/6);

      if (imgOrVec == 0) {                 //visualize vector graphic
        stroke(vizObjectC[i]-80, 20, 150, 255);
        strokeWeight(4);
        pushMatrix();
        fill(vizObjectC[i], 50+grad[i], 190, 255);
        popMatrix();
        rectMode(CENTER);  
        ellipseMode(CENTER);
        if (shape[i]==0) {
          rect(x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
        } else {
          ellipse(x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
        }
      }
      if (imgOrVec == 1) {                 //visualize with png
        imageMode(CENTER);
        image(image, x+vizObjectLocX[i], y+vizObjectLocY[i], objSize, objSize);
      }
    }
    fill(0);
    text(question, width/2, qEdgeDist);
  }

  public void keyPressed(int key) {
    switch(key) {
    case '1': 
      tally[0]++;
      shape[0] = (int)random(3);
      vizObjectLocX[0]+=objSize;
      if (vizObjectLocX[0]>(objSize*4)) {
        vizObjectLocX[0]=0;
        vizObjectLocY[0]-=objSpace;
        grad[0]+=10;
      }
      break;
    case '2':
      tally[1]++;
      shape[1] = (int)random(3);
      vizObjectLocX[1]+=objSize;
      if (vizObjectLocX[1]>(objSize*4)) {
        vizObjectLocX[1]=0;
        vizObjectLocY[1]-=objSpace;
        grad[1]+=10;
      }
      break;
    case '3':
      tally[2]++;
      shape[2] = (int)random(3);
      vizObjectLocX[2]+=objSize;
      if (vizObjectLocX[2]>(objSize*4)) {
        vizObjectLocX[2]=0;
        vizObjectLocY[2]-=objSpace;
        grad[2]+=10;
      }
      break;
    case '4': 
      tally[3]++;
      shape[3] = (int)random(3);
      vizObjectLocX[3]+=objSize;
      if (vizObjectLocX[3]>(objSize*4)) {
        vizObjectLocX[3]=0;
        vizObjectLocY[3]-=objSpace;
        grad[3]+=10;
      }
      break;
    case '5': 
      tally[4]++;
      shape[4] = (int)random(3);
      vizObjectLocX[4]+=objSize;
      if (vizObjectLocX[4]>(objSize*4)) {
        vizObjectLocX[4]=0;
        vizObjectLocY[4]-=objSpace;
        grad[4]+=10;
      }
      break;
    case '0':
      if (tally[0]>0 || tally[1]>0 || tally[2]>0 || tally[3]>0 || tally[4]>0) {
        saveFrame("saved_daily_images/GALAdaily_"+timestamp()+".png");
      }
      x=-50;
      y=height-40;
      for (int i=0; i<5; i++) {
        vizObjectLocX[i]=0;
        vizObjectLocY[i]=0;
        tally[i]=0;
        grad[i]=gradReset[i];
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
class ImagesManager {
  
  String pngPath; 
  String backPath;
  
  File pngDir;
  File backDir;
  
  String[] pngFiles;
  String[] backFiles;
  
  float randomizer;

  ImagesManager() {
    
    // PNGs
    pngPath = dataPath("images");
    File pngDir = new File(pngPath);
    pngFiles = pngDir.list();
    println(pngFiles);
    
    // Backgrounds
    backPath = dataPath("background");
    File backDir = new File(backPath);
    backFiles = backDir.list();
    println(backFiles);
    
  } 
  
  public PImage getRandomPNG(){
    String imageName;
    
    if (pngFiles.length > 0) {
      
      randomizer = random((int)pngFiles.length);
      imageName = pngFiles[(int)randomizer];
       
      if (imageName.equals(".DS_Store")){
        randomizer = random((int)pngFiles.length);
        imageName = pngFiles[(int)randomizer];
        println("IMAGE .DS_STORE SKIPPED!!!!");
      }
      
      PImage png = loadImage(pngPath + "/" + imageName);
      println("currentPNG" + " " + imageName);
      return png;
    } else return null;
    
  }
  
   public PImage getRandomBack(){
    String imageName;
      
    if (backFiles.length > 0) {
      
      randomizer = random((int)backFiles.length);
      imageName = backFiles[(int)randomizer];
      
      if (imageName.equals(".DS_Store")){
        randomizer = random((int)backFiles.length);
        imageName = backFiles[(int)randomizer];
      }
        
      PImage back = loadImage(backPath +  "/" + imageName );
       println("currentBack" + " " + imageName);
      return back;
    } else return null;
    
  }
    
}
class QuestionsManager {

  // A Table object
  Table table;
  String currentQuestion; //current question
  String movingQuestion; //represents moving question
  
  QuestionsManager() { 
    table = loadTable("data/questions/Gala_CSV_Questions.csv");
  } 
  
  private void loadQuestion() {
    currentQuestion = table.getString(table.getRowCount()-1, 0);
    getReadyToNext();
  }
  
  private void getReadyToNext() {
    
    table.addRow();                                       //add a row
    for (int i=table.getRowCount()-2; i>=0; i--) {        //copy every row string to the row below
      movingQuestion = table.getString(i, 0);
      table.setString(i+1, 0, movingQuestion);
    }
    
    movingQuestion = table.getString(table.getRowCount()-1, 0);    //move the bottom row string to the top
    table.setString(0, 0, movingQuestion);
    table.removeRow(table.getRowCount()-1); 
    saveTable(table, "data/questions/Gala_CSV_Questions.csv");           // Writing the CSV back to the same file        
  }
  
  public String getCurrentQuestion(){
    this.loadQuestion();
    return currentQuestion;
  }
}
  public void settings() {  fullScreen();  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GalaInteractiveKiosk" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
