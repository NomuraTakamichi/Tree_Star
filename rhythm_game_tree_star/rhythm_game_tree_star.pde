/***** SETUP *****/
void setup() {

  size(800, 1000);

  red = loadImage("\\c:\\SWdata\\note_red.png"); 
  red.resize(blockWidth, blockHeight);
  blue = loadImage("\\c:\\SWdata\\note_blue.png"); 
  blue.resize(blockWidth, blockHeight);
  green = loadImage("\\c:\\SWdata\\note_green.png"); 
  green.resize(blockWidth, blockHeight);
  yellow = loadImage("\\c:\\SWdata\\note_yellow.png"); 
  yellow.resize(blockWidth, blockHeight);

  buildBlocks();
}

/***** DRAW *****/
void draw() {
  gameScreen();
}  


void gameScreen() {

  gameBackground();
  speed = 20;

  /** Blocks **/

  for (int i = 0; i < rBlocks.size(); i+=1) {
    temp = rBlocks.get(i);
    image(red, line1, temp);
    rBlocks.set(i, temp+speed);
  }

  for (int i = 0; i < bBlocks.size(); i+=1) {
    temp = bBlocks.get(i);
    image(blue, line2, temp);
    bBlocks.set(i, temp+speed);
  }

  for (int i = 0; i < gBlocks.size(); i+=1) {
    temp = gBlocks.get(i);
    image(green, line3, temp);
    gBlocks.set(i, temp+speed);
  }

  for (int i = 0; i < yBlocks.size(); i+=1) {
    temp = yBlocks.get(i);
    image(yellow, line4, temp);
    yBlocks.set(i, temp+speed);
  }
}

void buildBlocks() {

  rBlocks = new ArrayList<Float>(); 
  bBlocks = new ArrayList<Float>(); 
  gBlocks = new ArrayList<Float>();  
  yBlocks = new ArrayList<Float>(); 

  lines = loadStrings("\\c:\\SWdata\\map1.txt");


  for (int i = 0; i < lines.length; i+= 1) {

    String parts[] = lines[i].split(" ");
    k = parts[0];
    v = Float.parseFloat(parts[1])*-11; // *-10.4

    if (k.equals("r")) {
      rBlocks.add(v);
    } else if (k.equals("b")) {
      bBlocks.add(v);
    } else if (k.equals("g")) {
      gBlocks.add(v);
    } else if (k.equals("y")) {
      yBlocks.add(v);
    }
  }
}

void judge(String a) {
  if (a.equals("red")) {
    //if (!rBlocks.isEmpty()) {
    float x = rBlocks.get(0);
    //perfect++;
    if (hit_top + 20 <= x && x <= hit_bottom - 20) {
      rBlocks.remove(0);
      score += 50;
      combo++;
      perfectkey ++;
      judge = 1;
      health -= 10;
      if (health <= 0) {
        health = 0;
      }
    } else if (hit_top <= x && x <= hit_bottom) {
      rBlocks.remove(0);
      //good++;
      score += 25;
      goodkey ++;
      combo++;
      judge = 2;
      health -= 6;
      if (health <= 0) {
        health = 0;
      }
    } else if  (hit_top - 100 <= x && x <= hit_bottom + 200) {
      rBlocks.remove(0);
      //bad++;
      score += 0;
      misskey ++;
      if (maxcombo < combo) {
        maxcombo = combo;
      }
      combo = 0;
      judge = 3;
      health += 6;
      if (health >= 800) {
        //stopAll();
      }
    }
    //}
  } else if (a.equals("green")) {
    //if (!gBlocks.isEmpty()) {
    float x = gBlocks.get(0);
    if (hit_top + 20 <= x && x <= hit_bottom - 20) {
      gBlocks.remove(0);
      perfectkey++;
      score += 50;
      combo++;
      judge = 1;
      health -= 10;
      if (health <= 0) {
        health = 0;
      }
    } else if (hit_top <= x && x <= hit_bottom) {
      gBlocks.remove(0);
      goodkey++;
      score += 25;
      combo++;
      judge = 2;
      health -= 6;
      if (health <= 0) {
        health = 0;
      }
    } else if  (hit_top - 100 <= x && x <= hit_bottom + 200) {
      gBlocks.remove(0);
      misskey++;
      score += 0;
      combo = 0;
      judge = 3;
      health += 6;
      if (health >= 800) {
        //stopAll();
      }
    }
    //}
  } else if (a.equals("blue")) {
    //if (!bBlocks.isEmpty()) {
    float x = bBlocks.get(0);
    if (hit_top + 20 <= x && x <= hit_bottom - 20) {
      bBlocks.remove(0);
      perfectkey++;
      score += 50;
      combo++;
      judge = 1;
      health -= 10;
      if (health <= 0) {
        health = 0;
      }
    } else if (hit_top <= x && x <= hit_bottom) {
      bBlocks.remove(0);
      goodkey++;
      score += 25;
      combo++;
      judge = 2;
      health -= 6;
      if (health <= 0) {
        health = 0;
      }
    } else if (hit_top - 100 <= x && x <= hit_bottom + 200) {
      bBlocks.remove(0);
      misskey++;
      score += 0;
      combo = 0;
      judge = 3;
      health += 6;
      if (health >= 800) {
        //stopAll();
      }
    }
    //}
  } else if (a.equals("yellow")) {
    //if (!yBlocks.isEmpty()) {
    float x = yBlocks.get(0);
    if (hit_top + 20 <= x && x <= hit_bottom - 20) {
      yBlocks.remove(0);
      perfectkey++;
      score += 50;
      combo++;
      judge = 1;
      health -= 10;
      if (health <= 0) {
        health = 0;
      }
    } else if (hit_top <= x && x <= hit_bottom) {
      yBlocks.remove(0);
      goodkey++;
      score += 25;
      combo++;
      judge = 2;
      health -= 6;
      if (health <= 0) {
        health = 0;
      }
    } else if  (hit_top - 100 <= x && x <= hit_bottom + 200) {
      yBlocks.remove(0);
      misskey++;
      score += 0;
      combo = 0;
      judge = 3;
      health += 6;
      if (health >= 800) {
        //stopAll();
      }
    }
    //}
  }
}

void keyPressed() {
  /** RED **/
  if (key == 'a' && !rPressed) {
    //beatpress.trigger();
    //r_press = true;
    r_time = 7;
    judge("red");
    rPressed = true;
  }
  /** GREEN **/
  if (key == 'd' && !gPressed) {
    //beatpress.trigger();
    //g_press = true;
    g_time = 7;
    judge("green");
    gPressed = true;
  }
  /** BLUE **/
  if (key == 's' && !bPressed) {
    //beatpress.trigger();
    //b_press = true;
    b_time = 7;
    judge("blue");
    bPressed = true;
  }
  /** YELLOW **/
  if (key == 'f' && !yPressed) {
    //beatpress.trigger();
    //y_press = true;
    y_time = 7;
    judge("yellow");
    yPressed = true;
  }
}
void keyReleased() {
  /** GAME SCREEN **/
  /** RED **/
  if (key == 'a' && rPressed) {
    rPressed = false;
  }
  /** GREEN **/
  if (key == 'd' && gPressed) {
    gPressed = false;
  }
  /** BLUE **/
  if (key == 's' && bPressed) {
    bPressed = false;
  }
  /** YELLOW **/
  if (key == 'f' && yPressed) {
    yPressed = false;
  }
}
