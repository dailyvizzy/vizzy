/*todo
 --> We need at least 2 more different animations -Andrew and Javi   --> one with sine waves that change amplitude -->could one be a series of spirals?
 --> collect really subtle background images? - Andrew and Javi
 --> need to hook up and test arduino with buttons
 --> screengrab needs to be saved to folder once per question right before question changes --Andrew
 --> White strip to see text question - Javi
 
 Stretch:
 --> do we want to slightly animate the PNGs?
 */

import java.util.Calendar;

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
  textAlign(CENTER, CENTER);

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