
/*todo
--> pngs are not sizing proportionally, backup plan resize in photoshop to make square
--> some questions don't make sense with 1-5 scale
--> We need at least 2 more different animations
--> what to do with background?
--> need to hook up and test arduino with buttons
--> when questions are long they go off the screen, when short can be too small
--> some image scaling probably needs to happen in the bar graph
--> need to change question once per day (automatically)
--> screengrab needs to be saved to folder once per question right before question changes

Questions:
--> Trails or not on bar graph images?
--> Do we want question to always be on top of image?
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