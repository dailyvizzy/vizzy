float x=0, y=0;
float pick=0;
boolean firsttime=true;

void setup() {
  fullScreen();
  background(255, 255, 255);
}

void draw() {

  if (firsttime==true || second()%10==0) {
    firsttime=false;
    background(255);
    strokeWeight(2);
    for (int col=0; col<(height+1000); col+=100) {

      for (int row =0; row<(width+1000); row+=100) {
        stroke(random(255), 40, random(255), 30);
        pick = (int)random(2);
        //println(pick + " " + row + " " +col);
        for (int i = 0; i<=100; i+=10) {
          if (pick==1) {
            line(row+i, col, row+i, col+100);
          } else {
            line(row, col+i, row+100, col+i);
          }
        }
      }
    }
  }
}