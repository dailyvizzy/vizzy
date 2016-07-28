
/*todo
--> pngs are not sizing proportionally, resize in photoshop to make square -Andrew
--> some questions don't make sense with 1-5 scale -Andrew
--> We need at least 2 more different animations -Andrew and Javi
--> collect really subtle background images - Andrew
--> need to hook up and test arduino with buttons
--> when questions are long they go off the screen, when short can be too small -Javi
--> need to change question once per day (automatically) - Question for group
--> screengrab needs to be saved to folder once per question right before question changes - Question for group
--> White strip to seee question - Javi

Stretch:
--> do we want to slightly animate the PNGs?
*/

AnimationsManager animationsManager;
FontsManager fontsManager;
ImagesManager imagesManager;
QuestionsManager questionsManager;

AbstractAnimation dailyAnimation;


void setup () {
  
  //size(1024, 768);
  noCursor();
  fullScreen();
  smooth();
  frameRate(60);
  textAlign(CENTER,CENTER);
  
  animationsManager = new AnimationsManager(this);
  fontsManager = new FontsManager();
  imagesManager = new ImagesManager();
  questionsManager = new QuestionsManager();
  
  animationsManager.initAnimations();
  getRandomElements();

}

void getRandomElements() {
  
  dailyAnimation = animationsManager.getRandomAnimation();
  dailyAnimation.font = fontsManager.getRandomFont();
  dailyAnimation.image = imagesManager.getRandomPNG();
  dailyAnimation.background = imagesManager.getRandomBack();
  dailyAnimation.question = questionsManager.getCurrentQuestion();
  dailyAnimation.imgOrVec = (int)random(2);
  
  dailyAnimation.setup();
}

void draw() {
  if (dailyAnimation != null) dailyAnimation.draw();
}

void update() {
   if (dailyAnimation != null) dailyAnimation.update();
}

void keyPressed () {
  
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