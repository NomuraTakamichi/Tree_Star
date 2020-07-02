//button 
class Button {
  int x, y;
  String label;
  Button(int x, int y, String label) {
    this.x = x;
    this.y = y;
    this.label = label;
  }
  void draw() {
    fill(223);
    if (over()) {
      fill(233);
    }
    //rectMode(CENTER);
    rect(width/2-150, height/2-178, 300, 80);
    fill(0);
    textSize(55);
    text(label, x-35, y + 17);
  }
  boolean over() {
    if (mouseX >= x && mouseY >= y && mouseX <= x + textWidth(label) && mouseY <= y + 22) {
      return true;
    }
    return false;
  }
}

// create note
//void input_timing(){
//  switch(key)
//  {
//  case'a':
//    key = 0;
//    println("r "+int(time));
//    break;
//  case's':
//    key = 0;
//    println("b "+int(time));
//    break;
//  case'd':
//    key = 0;
//    println("g "+int(time));
//    break;
//  case'f':
//    key = 0;
//    println("y "+int(time));
//    break;
//  case'w':
//    key = 0;
//    println("timing saved.");
//    break;
//  }
//}
