
/** BLOCKS **/
void buildBlocks() {
  
  rBlocks = new ArrayList<Float>(); 
  bBlocks = new ArrayList<Float>(); 
  gBlocks = new ArrayList<Float>();  
  yBlocks = new ArrayList<Float>(); 

  lines = loadStrings("map1.txt");
  for (int i = 0; i < lines.length; i+= 1) {

    String parts[] = lines[i].split(" ");
    k = parts[0];
    v = Float.parseFloat(parts[1])*-11.109;
                        // speed = 19.2005;
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


/** gameState = 1 **/
void gameScreen() {
  gameBackground();
  speed = 19.2005;
  /** Blocks **/
  for (int i = 0; i<rBlocks.size(); i++) {
    temp = rBlocks.get(i);
    image(red, line1, temp);
    rBlocks.set(i, temp+speed);
  }
  for (int i = 0; i<bBlocks.size(); i++) {
    temp = bBlocks.get(i);
    image(blue, line2, temp);
    bBlocks.set(i, temp+speed);
  }
  for (int i = 0; i<gBlocks.size(); i++) {
    temp = gBlocks.get(i);
    image(green, line3, temp);
    gBlocks.set(i, temp+speed);
  }
  for (int i = 0; i<yBlocks.size(); i++) {
    temp = yBlocks.get(i);
    image(yellow, line4, temp);
    yBlocks.set(i, temp+speed);
  }
  if (control) {
    /** CHECK MISS **/
    if (!rBlocks.isEmpty()) {
      if (rBlocks.get(0) > 1001) {
        rBlocks.remove(0);
        misskey += 1;
        judge = 4;
        judge_miss = true;
        if (maxcombo < combo) {
          maxcombo = combo;
        }
        combo = 0;
        health += 40;
        if (health >= 1001) {
          gameState = 2;
          control = false;
          gameover();
        }
      }
    }
    if (!gBlocks.isEmpty()) {
      if (gBlocks.get(0) > 1001) {
        gBlocks.remove(0);
        misskey += 1;
        judge = 4;
        judge_miss = true;
        if (maxcombo < combo) {
          maxcombo = combo;
        }
        combo = 0;
        health += 40;
        if (health >= 1001) {
          gameState = 2;
          control = false;
          gameover();
        }
      }
    }
    if (!bBlocks.isEmpty()) {
      if (bBlocks.get(0) > 1001) {
        bBlocks.remove(0);
        misskey += 1;
        judge = 4;
        judge_miss = true;
        if (maxcombo < combo) {
          maxcombo = combo;
        }
        combo = 0;
        health += 40;
        if (health >= 1001) {
          gameState = 2;
          control = false;
          gameover();
        }
      }
    } else {
      gameState = 3;
      //gameclear();
    }
    if (!yBlocks.isEmpty()) {
      if (yBlocks.get(0) > 1001) {
        yBlocks.remove(0);
        misskey += 1;
        judge = 4;
        judge_miss = true;
        if (maxcombo < combo) {
          maxcombo = combo;
        }
        combo = 0;
        health += 40;
        if (health >= 1001) {
          gameState = 2;
          control = false;
          gameover();
        }
      }
    }
  } else {
    temp = 0.0;
    speed = 0.0;
  }
}

/** gameState = 1 **/
void judge(String a) {
  /**  judge(RED) **/
  if (a.equals("red")) {
    if (!rBlocks.isEmpty()) {
      float x = rBlocks.get(0);
      //perfect++;
      if (hit_top + 20 <= x && x <= hit_bottom - 20) {
        rBlocks.remove(0);
        if (combo >= 15) {
          score += 150;
        } else if (combo >= 10) {
          score += 100;
        } else {
          score += 50;
        }
        combo++;
        perfectkey ++;
        judge = 1;
        health -= 10;
        if (health <= 0) {
          health = 0;
        }
        judge_per = true;
      } else if (hit_top <= x && x <= hit_bottom) {
        rBlocks.remove(0);
        //good++;
        if (combo >= 15) {
          score += 100;
        } else if (combo >= 10) {
          score += 50;
        } else {
          score += 25;
        }
        goodkey ++;
        combo++;
        judge = 2;
        health -= 6;
        if (health <= 0) {
          health = 0;
        }
        judge_goo = true;
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
        judge_miss = true;
        if (health >= 1001) {
          gameover();
        }
      }
    }
  } 
  /**  judge(GREEN) **/
  else if (a.equals("green")) {
    if (!gBlocks.isEmpty()) {
      float x = gBlocks.get(0);
      if (hit_top + 20 <= x && x <= hit_bottom - 20) {
        gBlocks.remove(0);
        perfectkey++;
        if (combo >= 15) {
          score += 150;
        } else if (combo >= 10) {
          score += 100;
        } else {
          score += 50;
        }
        combo++;
        judge = 1;
        health -= 10;
        if (health <= 0) {
          health = 0;
        }
        judge_per = true;
      } else if (hit_top <= x && x <= hit_bottom) {
        gBlocks.remove(0);
        goodkey++;
        if (combo >= 15) {
          score += 100;
        } else if (combo >= 10) {
          score += 50;
        } else {
          score += 25;
        }
        combo++;
        judge = 2;
        health -= 6;
        if (health <= 0) {
          health = 0;
        }
        judge_goo = true;
      } else if  (hit_top - 100 <= x && x <= hit_bottom + 200) {
        gBlocks.remove(0);
        misskey++;
        score += 0;
        if (maxcombo < combo) {
          maxcombo = combo;
        }
        combo = 0;
        judge = 3;
        health += 6;
        judge_miss = true;
        if (health >= 1001) {
          gameover();
        }
      }
    }
  }
  /**  judge(BLUE) **/
  else if (a.equals("blue")) {
    if (!bBlocks.isEmpty()) {
      float x = bBlocks.get(0);
      if (hit_top + 20 <= x && x <= hit_bottom - 20) {
        bBlocks.remove(0);
        perfectkey++;
        if (combo >= 15) {
          score += 150;
        } else if (combo >= 10) {
          score += 100;
        } else {
          score += 50;
        }
        combo++;
        judge = 1;
        health -= 10;
        if (health <= 0) {
          health = 0;
        }
        judge_per = true;
      } else if (hit_top <= x && x <= hit_bottom) {
        bBlocks.remove(0);
        goodkey++;
        if (combo >= 15) {
          score += 100;
        } else if (combo >= 10) {
          score += 50;
        } else {
          score += 25;
        }
        combo++;
        judge = 2;
        health -= 6;
        if (health <= 0) {
          health = 0;
        }
        judge_goo = true;
      } else if (hit_top - 100 <= x && x <= hit_bottom + 200) {
        bBlocks.remove(0);
        misskey++;
        score += 0;
        if (maxcombo < combo) {
          maxcombo = combo;
        }
        combo = 0;
        judge = 3;
        health += 6;
        judge_miss = true;
        if (health >= 1001) {
          gameover();
        }
      }
    } else if (control == false) {
      gameState = 4;
    } else {
      gameState = 3;
      gameclear();
    }
  }
  /**  judge(YELLOW)**/
  else if (a.equals("yellow")) {
    if (!yBlocks.isEmpty()) {
      float x = yBlocks.get(0);
      if (hit_top + 20 <= x && x <= hit_bottom - 20) {
        yBlocks.remove(0);
        perfectkey++;
        if (combo >= 15) {
          score += 150;
        } else if (combo >= 10) {
          score += 100;
        } else {
          score += 50;
        }
        judge_per = true;
        combo++;
        judge = 1;
        health -= 10;
        if (health <= 0) {
          health = 0;
        }
      } else if (hit_top <= x && x <= hit_bottom) {
        yBlocks.remove(0);
        goodkey++;
        if (combo >= 15) {
          score += 100;
        } else if (combo >= 10) {
          score += 50;
        } else {
          score += 25;
        }
        combo++;
        judge = 2;
        health -= 6;
        if (health <= 0) {
          health = 0;
        }
        judge_goo = true;
      } else if  (hit_top - 100 <= x && x <= hit_bottom + 200) {
        yBlocks.remove(0);
        misskey++;
        score += 0;
        if (maxcombo < combo) {
          maxcombo = combo;
        }
        combo = 0;
        judge = 3;
        health += 6;
        judge_miss = true;
        if (health >= 1001) {
          gameover();
        }
      }
    }
  }
}

/** game clear **/
void gameclear() {
  control = false;
  image(gameclear, 0, 0, width, height);
  //score
  result[0] = String.valueOf(score);
  fill(255);
  textSize(70);
  text(result[0], 120, 420);
  //maxcombo
  result[1] = String.valueOf(maxcombo);
  fill(255);
  textSize(70);
  text(result[1], 140, 650);
  //perfect
  result[2] = String.valueOf(perfectkey);
  fill(255);
  textSize(50);
  text(result[2], 220, 880);
  //good
  result[3] = String.valueOf(goodkey);
  fill(255);
  textSize(50);
  text(result[3], 390, 880);
  //miss
  result[4] = String.valueOf(misskey);
  fill(255);
  text(result[4], 560, 880);
  //grade
  if (score >= 5000) {
    image(star3, 460, 400, 300, 300);
  } else if (score >= 4000) {
    image(star2, 470, 450, 300, 200);
  } else if (score >= 3000) {
    image(star1, 520, 450, 200, 200);
  } else {
    fill(0);
    textSize(240);
    text('F', 540, 630);
  }
}
