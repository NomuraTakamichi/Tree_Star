import ddf.minim.*;

//audio
Minim minim;
//note create  is player3
AudioPlayer player1,player2,player3;

PImage red,blue,yellow,green;
PImage gameover,backscreen,gameclear,pause,songselect;
PImage star1,star2,star3;
ArrayList<Float> rBlocks;
ArrayList<Float> bBlocks;
ArrayList<Float> gBlocks;
ArrayList<Float> yBlocks;
Float temp; 
Float speed;
PrintWriter map;
String[] lines;
String k; 
float v;
int blockWidth = 100;
int blockHeight = 50;
int line1 = 100;
int line2 = 200;
int line3 = 300;
int line4 = 400;
ArrayList<Float> rNotes;
ArrayList<Float> gNotes;
ArrayList<Float> bNotes;
ArrayList<Float> yNotes;
boolean rPressed = false; 
boolean gPressed = false;
boolean bPressed = false; 
boolean yPressed = false;
int r_time = 0; 
int g_time = 0; 
int b_time = 0; 
int y_time = 0;
int judge = 0;
int gameState = 0;
boolean control;
boolean judge_per,judge_goo,judge_miss;
String fileName; 

Button button1,button2;

// note1
float time;

//songstop
int songop = 0;
