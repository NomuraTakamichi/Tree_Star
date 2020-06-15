
GameScreen sa;
Button button;
Button setting;

int exitCode = -1;
float mainTextX = 0;

void settings(){
  size(400,400);
}
void setup() {
  button = new Button(width / 2 -10,height / 2-10, "Start");
  
  textSize(50);
  
}
void draw() {
  background(255);
  for (int i=0; i<4; i++)
    {
      float ay = height/2 + (i * 20 *atan(millis()/1000.0)) + 150 * sin(millis()/1000.0);
      float by = height/2 - 200 + (i * 40 *atan(millis()/1000.0)) + 150 * cos(millis()/1000.0);
      line(0, ay, width, by);
      ellipse(width/2 + 100 * sin(millis()/1000.0) + 60 * sin(i*millis()/1000.0), height/2 + 80 * sin(millis()/1000.0) + 50 * sin(i*millis()/1000.0), 10, 10);
    }

  button.draw();
}

// Button class
class Button {
  int x, y;
  String label;
  Button(int x, int y, String label) {
    this.x = x;
    this.y = y;
    this.label = label;
  }
  void draw() {
    fill(228);
    if (over()) {
      fill(254);
    }
    rect(x-50, y-20, 122, 52);
    fill(0);
    text(label, x-50, y + 20);
  }
  boolean over() {
    if (mouseX >= x && mouseY >= y && mouseX <= x + textWidth(label) && mouseY <= y + 22) {
      return true;
    }
    return false;
  }
}

// Open GameScreen 
void mousePressed() {
  if (button.over()) {
    
    String[] args = {"GameScreen"};
    sa = new GameScreen(this);
    PApplet.runSketch(args,sa);
    
    // Check if SubWindow is over
    if( sa != null && !sa.getSurface().isStopped()){
      // Subwindow continues
      text("Main", mainTextX++, height/2 );
      if(mainTextX > width){
        mainTextX = 0;
      }   
    }
    else {
      // Subwindow stop
      text("Sub is stoped. \nCode=" + exitCode, 0, height/2 );
      if( sa != null ){
        sa.dispose();
        sa = null;
      }    
    } 
   }
}

// GameScreen
public void GetGameScreen(int status){
  exitCode = status;
}
