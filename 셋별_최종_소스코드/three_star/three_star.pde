//FINALLLLLLLLLLLLLLLLL REALLY

/***** SETUP *****/
void settings() {
  size(800, 1000);
  minim = new Minim(this);
  player1 = minim.loadFile("Set it all free .mp3");
  
}
void setup() {
  //songselect
  songselect = loadImage("songselectscreen.png");
  //backscreen
  backscreen = loadImage("backscreen.png");
  //game over
  gameover = loadImage("GameOver.png");
  //game clear
  gameclear = loadImage("GameClear.png");
  //pause
  pause = loadImage("Pause.png");
  //grade
  star1 = loadImage("onestar.png");
  star2 = loadImage("twostar.png");
  star3 = loadImage("treestar.png");
  //Notes
  red = loadImage("note_red.png"); 
  red.resize(blockWidth, blockHeight);
  blue = loadImage("note_blue.png"); 
  blue.resize(blockWidth, blockHeight);
  green = loadImage("note_green.png"); 
  green.resize(blockWidth, blockHeight);
  yellow = loadImage("note_yellow.png"); 
  yellow.resize(blockWidth, blockHeight);
  
  //button create
  button1 = new Button(width /2 - 100 ,height / 2 - 140, "Play Game");

  buildBlocks();
  control = true;
}

/***** DRAW *****/
void draw() {
  if (gameState == 0) {
    SongSelect();
    time = millis() / 10.0;
  //input_timing();
  } else if (gameState == 1) {
    player1.play();
    gameScreen();
  } else if (gameState == 2) {
    player1.pause();
    player1.rewind();
    gameover();
  } else if (gameState == 3) {
    gameclear();
    player1.pause();  
  } else if (gameState == 4) {
    player1.pause();
    pause();
  }
  if (control) {
    decision();
  }

  if (combo >= 10) {
    fill(246, 4, 198);
    textSize(90);
    text("x4", 620, 200);
  } else if (combo >= 7) {
    fill(190, 104, 187);
    textSize(90);
    text("x2", 620, 200);
  }
}  
/** gameState = 0 **/
void SongSelect(){
  image(songselect, 0, 0, width, height);
  button1.draw();
}



/** gameState = 2 **/
void gameover() {
  image(gameover, 0, 0, width, height);
}

/** game reset **/
void reset() {
  perfectkey = 0;
  goodkey = 0;
  misskey = 0;
  misskey = 0;
  maxcombo = 0;
  combo = 0;
  score = 0;
  health = 0;
  buildBlocks();
}

void pause() {
  control = false;
  image(pause, 0, 0, width, height);
}
void decision() {
  if (judge_per) {
    fill(198, 9, 9);
    textSize(70);
    text("perfect", 170, 300);
  } else if (judge_goo) {
    fill(245, 237, 7);
    textSize(70);
    text("good", 196, 300);
  } else if (judge_miss) {
    fill(184, 184, 175);
    textSize(70);
    text("miss", 196, 300);
  }
}
void keyPressed() {
  /** RED **/
  if (key == 'j' && !rPressed) {
    //beatpress.trigger();
    //r_press = true;
    r_time = 7;
    judge("red");
    control = true;
    rPressed = true;
  }
  /** GREEN **/
  if (key == 'l' && !gPressed) {
    //beatpress.trigger();
    //g_press = true;
    g_time = 7;
    judge("green");
    control = true;
    gPressed = true;
  }
  /** BLUE **/
  if (key == 'k' && !bPressed) {
    //beatpress.trigger();
    //b_press = true;
    b_time = 7;
    judge("blue");
    control = true;
    bPressed = true;
  }
  /** YELLOW **/
  if (key == ';' && !yPressed) {
    //beatpress.trigger();
    //y_press = true;
    y_time = 7;
    judge("yellow");
    control = true;
    yPressed = true;
  }
  /** gameState = 2 **/
  if (gameState == 3) {
    
    player1.pause();
    player1.rewind();
    
    if (key == ' ') {
      gameState = 0;
    }
  }
  ///** PAUSE **/
  //if (key == ' ') {
  //  gameState = 4;
  //}
  //if (!control) {
  //  if (key == ' ') {
  //    control = true;
  //    gameState = 1;
  //  } else if (key == 'q') {
  //    player.pause();
  //    player.rewind();
  //    reset();
  //    control = true;
  //    gameState = 1;
  //  }
  //}
  ///** GAME OVER **/
  //if (gameState == 2) {
  //  if (key == 'q') {
  //    reset();
  //    gameState = 1;
  //  }
  //}
  /** PAUSE **/
  if (key == ' ') {
    if(gameState != 1){
    }
    else{
      gameState = 4;
    }
  }
  if (!control) {
    if (key == ' ') {
      control = true;
      gameState = 1;
    } else if (key == 'q') {
      reset();
      control = true;
      gameState = 0;
    }
  }
  /** GAME OVER **/
  if (gameState == 2) {
    if (key == 'q') {
      reset();
      gameState = 0;
    }
  }
  
  /** GAME CLEAR **/
  if(gameState == 3){
   
    player1.pause();
    player1.rewind();
    
    if(key == 'q'){
       reset();
       gameState = 0;
    }
  }
}
void keyReleased() {
  /** GAME SCREEN **/
  fileName = "drum-japanese1.mp3";
  
  judge_per = false;
  judge_goo = false;
  judge_miss = false;
  /** RED **/
  if (key == 'j' && rPressed) {
    if(gameState == 1){
      rPressed = false;
    //player2 = minim.loadFile( fileName );
    //player2.play( 0 );
    }
    else{
    }
  }
  /** GREEN **/
  if (key == 'l' && gPressed) {
    if(gameState == 1){
      gPressed = false;
    //player2 = minim.loadFile( fileName );
    //player2.play( 0 );
    }
    else{
    }
  }
  /** BLUE **/
  if (key == 'k' && bPressed) {
    if(gameState == 1){
      bPressed = false;
    //player2 = minim.loadFile( fileName );
    //player2.play( 0 );
    }
    else{
    }
  }
  /** YELLOW **/
  if (key == ';' && yPressed) {
    if(gameState == 1){
      yPressed = false;
    //player2 = minim.loadFile( fileName );
    //player2.play( 0 );
    }
    else{
    }
  }
  else{
    key = 0;
  }
}

public void mousePressed() {
  //song 1
  if (button1.over()) {
    gameState = 1;
    player1.rewind();
    player1.play();
   }
   
   //if (button2.over()) {
   //  if( songop == 0){
   //    player1.play();
   //    songop = 1;
   //  }
   //  else{
   //    player1.pause();
   //    songop = 0;
   //  }
    
   
}
