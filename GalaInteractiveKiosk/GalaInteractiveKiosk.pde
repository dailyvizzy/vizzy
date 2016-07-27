
/*todo
--> .DS file is showing up as font sometimes
--> pngs are not sizing proportionally , backup plan resize in photoshop to make square
--> some questions don't make sense with 1-5 scale
--> We need at least 2 more different animations
--> what to do with background?
--> do we want to slightly animate the PNGs?
--> We'll need to hide the cursor
--> need to hook up and test arduino with buttons
--> when questions are long they go off the screen, when short can be too small
--> add PNG option to bargraph
*/

AnimationsManager animationsManager;
FontsManager fontsManager;
ImagesManager imagesManager;
QuestionsManager questionsManager;

AbstractAnimation dailyAnimation;


void setup () {
  
  //size(1024, 768);
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