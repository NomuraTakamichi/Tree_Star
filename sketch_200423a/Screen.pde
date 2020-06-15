import javax.swing.*;
import java.awt.event.*;
import java.lang.reflect.*;
import controlP5.*;

int gameState = 0;
ArrayList<Float> rNotes;
ArrayList<Float> gNotes;
ArrayList<Float> bNotes;
ArrayList<Float> yNotes;
Float temp = 0.0; 
int speed = 20;
int health = 0;
boolean r_press = false; 
boolean g_press = false;
boolean b_press = false; 
boolean y_press = false;
boolean rPressed = false; 
boolean gPressed = false;
boolean bPressed = false; 
boolean yPressed = false;
int r_time = 0; 
int g_time = 0; 
int b_time = 0; 
int y_time = 0;
int judge = 0;
String[] lines;
String k; float v;
int songState = 0;

PApplet subApp;
ControlP5 cp5;
PImage red,green,blue,yellow;
String[] textname = {"score","maxcombo","perfect","good","miss"};
String[] result = new String[5];
int yPos = 0;
int xPos = width;// ball position
// ball direction
int yDir = 2,xDir = 2;
final int diameter = 20; // ball size
int lineWidth = 70,lineThickness = 4;
int firstLineSpace = 80;
int hit_top = 700,hit_area = 60;
int hit_bottom = hit_top + hit_area;
int score = 0,combo = 0,maxcombo = 0,perfectkey = 0,goodkey = 0,misskey = 0;
float x = 100,y = 100;

public class GameScreen extends PApplet{
   PApplet mainApplet;
   int exitStatus = 0;
   Method method = null;
   float subTextX = 0;
   
   // Constract
   public GameScreen(PApplet _mainApplet){
       mainApplet = _mainApplet;
   } 
   void settings(){
      size(600,900); 
   }
   void setup(){
      // Get the exit status receiving method on the main window side
      try{
         method = mainApplet.getClass().getMethod("GetGameScreen",int.class); 
      }catch(NoSuchMethodException ex){
         ex.printStackTrace();  
      }
      
      /** PICTURES **/
      red = loadImage("\\c:\\SWdata\\note_red.png");
      green = loadImage("\\c:\\SWdata\\note_green.png");
      blue = loadImage("\\c:\\SWdata\\note_blue.png");
      yellow = loadImage("\\c:\\SWdata\\note_yellow.png");
      
      setScreen();
      buildNotes();
      
      // Rewrite the window operation event
      redefineExitEvent();
   }  
   void draw(){
      gameScreen();
  }
  void buildNotes() {
      rNotes = new ArrayList<Float>(); 
      gNotes = new ArrayList<Float>();  
      bNotes = new ArrayList<Float>(); 
      yNotes = new ArrayList<Float>(); 
      
      lines = loadStrings("\\c:\\SWdata\\map1.txt");
        
      for(int i = 0; i < lines.length; i++){
        String[] parts = lines[i].split(" ");
        k = parts[0];
        if (songState == 0){
          v = Float.parseFloat(parts[1])*-10.4;
        } 
        if (k.equals("red")){
          rNotes.add(v);
        } else if (k.equals("green")){
          gNotes.add(v);
        } else if (k.equals("blue")){
          bNotes.add(v);
        } else if (k.equals("yellow")){
          yNotes.add(v);
        }
      }
  }
  void gameScreen(){
      /** NOTES **/
      for(int i = 0; i < rNotes.size(); i+=1){
        temp = rNotes.get(i);
        System.out.println(temp);
        image(red, 50, temp);
        rNotes.set(i, temp+speed);
      }
      for(int i = 0; i < gNotes.size(); i+=1){
        temp = gNotes.get(i);
        image(green, 152, temp);
        System.out.println(temp);
        gNotes.set(i, temp+speed);
      }
      for(int i = 0; i < bNotes.size(); i+=1){
        temp = bNotes.get(i);
        image(blue, 254, temp);
        System.out.println(temp);
        bNotes.set(i, temp+speed);
      }
      for(int i = 0; i < yNotes.size(); i+=1){
        temp = yNotes.get(i);
        image(yellow, 356, temp);
        System.out.println(temp);
        yNotes.set(i, temp+speed);
      }
      
      /** CHECK MISS **/
      if (!rNotes.isEmpty()){
        if (rNotes.get(0) > 801){
          rNotes.remove(0);
          misskey += 1;
          judge = 4;
          combo = 0;
          health += 40;
          if (health >= 800){
            gameState = 5;
            //death.trigger();
            //stopAll();
          }
        }
      }
      if (!gNotes.isEmpty()){
        if (gNotes.get(0) > 801){
          gNotes.remove(0);
          misskey += 1;
          judge = 4;
          combo = 0;
          health += 40;
          if (health >= 800){
            gameState = 5;
            //death.trigger();
            //stopAll();
          }
        }
      }
      if (!bNotes.isEmpty()){
        if (bNotes.get(0) > 801){
          bNotes.remove(0);
          misskey += 1;
          judge = 4;
          combo = 0;
          health += 40;
          if (health >= 800){
            gameState = 5;
            //death.trigger();
            //stopAll();
          }
        }
      }
      if (!yNotes.isEmpty()){
        if (yNotes.get(0) > 801){
          yNotes.remove(0);
          misskey += 1;
          judge = 4;
          combo = 0;
          health += 40;
          if (health >= 800){
            gameState = 5;
            //death.trigger();
            //stopAll();
          }
        }
      }
      
      /** HEALTH BAR **/
      fill(255);
      rect(firstLineSpace + lineWidth * 4, health, 30, height);
      
      /** JUDGE **/
      //textFont(title, 85); //show judge
      if (judge == 1){
        fill(#ffcc33, 200);
        text("PERFECT", 252, 352);
      } else if (judge == 2){
        fill(97, 243, 92, 200);
        text("GOOD", 252, 352);
      } else if (judge == 3){
        fill(254, 13, 73, 200);
        text("BAD", 252, 352);
      } else if (judge == 4){
        fill(#ffcc33);
        text("MISS", 252, 352);
      }
      
  }
  void setScreen(){
      
      background(128);
      fill(0);
      // block lines
      for (int i = 0; i < 5; i += 1) {
        stroke(#FFCC33);
        strokeWeight(lineThickness);
        line(firstLineSpace + lineWidth * i, 0,
             firstLineSpace + lineWidth * i, height);
      }
      
      // hit place
      fill(#e51c12, 150);
      noStroke();
      rect(firstLineSpace, hit_top,
           lineWidth * 4, hit_area);
           
      //result
      int scoreboard = 300,y_re = 350;
      for(int i = 0;i<textname.length;i++){
        switch(i){
           case 0:
           case 1:
             fill(246,13,13);
             textSize(32);
             text(textname[i],425,scoreboard);
             scoreboard += 100;
             break;
           case 2:
             fill(#e0e233, 150);
             textSize(32);
             text(textname[i],425,scoreboard);
             scoreboard += 100;
             break;
           case 3:
             fill(#e51c12, 150);
             textSize(32);
             text(textname[i],425,scoreboard);
             scoreboard += 100;
             break;
           case 4:
             fill(0);
             textSize(32);
             text(textname[i],425,scoreboard);
        }
      }
      //score
      result[0] = String.valueOf(score);
      fill(255);
      textSize(32);
      text(result[0],475,y_re);
      y_re += 100;
      //maxcombo
      result[1] = String.valueOf(maxcombo);
      fill(255);
      textSize(32);
      text(result[1],475,y_re);
      y_re += 100;
      //perfect
      result[2] = String.valueOf(perfectkey);
      fill(255);
      textSize(32);
      text(result[2],475,y_re);
      y_re += 100;
      //good
      result[3] = String.valueOf(goodkey);
      fill(255);
      textSize(32);
      text(result[3],475,y_re);
      y_re += 100;
      //miss
      result[4] = String.valueOf(misskey);
      fill(255);
      textSize(32);
      text(result[4],475,y_re);
      y_re += 100;
  }  
  private JFrame getJFrame(){
    return (JFrame)
         ((processing.awt.PSurfaceAWT.SmoothCanvas)getSurface()
         .getNative()).getFrame();
  }
 
  private void redefineExitEvent() {
    JFrame frame = getJFrame();
 
    for (final java.awt.event.WindowListener evt :
         frame.getWindowListeners()){
      frame.removeWindowListener(evt);
      frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE );
      frame.addWindowListener(new WindowManage(this));
    }
  }
  void judge(String a){
    if (a.equals("red")){
      if (!rNotes.isEmpty()) {
      float x = rNotes.get(0);
        if (hit_top + 15 <= x && x <= hit_bottom - 30) {
          rNotes.remove(0);
          //perfect++;
          score += 25;
          combo++;
          perfectkey ++;
          judge = 1;
          health -= 10;
          if (health <= 0){
            health = 0;
          }
        }else if (hit_top <= x && x <= hit_bottom) {
          rNotes.remove(0);
          //good++;
          score += 50;
          goodkey ++;
          combo++;
          judge = 2;
          health -= 6;
          if (health <= 0){
            health = 0;
          }
        } else if  (hit_top - 50 <= x && x <= hit_bottom + 100){
          rNotes.remove(0);
          //bad++;
          score += 0;
          misskey ++;
          combo = 0;
          judge = 3;
          health += 6;
          if (health >= 800){
            //stopAll();
          }
        } 
      }
    } else if (a.equals("g")){
      if (!gNotes.isEmpty()) {
      float x = gNotes.get(0);
        if (hit_top + 15 <= x && x <= hit_bottom - 30) {
          rNotes.remove(0);
          perfectkey++;
          score += 25;
          combo++;
          judge = 1;
          health -= 10;
          if (health <= 0){
            health = 0;
          }
        }else if (hit_top <= x && x <= hit_bottom) {
          rNotes.remove(0);
          goodkey++;
          score += 50;
          combo++;
          judge = 2;
          health -= 6;
          if (health <= 0){
            health = 0;
          }
        } else if  (hit_top - 50 <= x && x <= hit_bottom + 100){
          rNotes.remove(0);
          misskey++;
          score += 0;
          combo = 0;
          judge = 3;
          health += 6;
          if (health >= 800){
            //stopAll();
          }
        } 
      }
    } else if (a.equals("b")){
      if (!bNotes.isEmpty()) {
      float x = bNotes.get(0);
        if (hit_top + 15 <= x && x <= hit_bottom - 30) {
          rNotes.remove(0);
          perfectkey++;
          score += 25;
          combo++;
          judge = 1;
          health -= 10;
          if (health <= 0){
            health = 0;
          }
        }else if (hit_top <= x && x <= hit_bottom) {
          rNotes.remove(0);
          goodkey++;
          score += 50;
          combo++;
          judge = 2;
          health -= 6;
          if (health <= 0){
            health = 0;
          }
        } else if  (hit_top - 50 <= x && x <= hit_bottom + 100){
          rNotes.remove(0);
          misskey++;
          score += 0;
          combo = 0;
          judge = 3;
          health += 6;
          if (health >= 800){
            //stopAll();
          }
        } 
      }
    } else if (a.equals("y")){
      if (!yNotes.isEmpty()) {
      float x = yNotes.get(0);
        if (hit_top + 15 <= x && x <= hit_bottom - 30) {
          rNotes.remove(0);
          perfectkey++;
          score += 25;
          combo++;
          judge = 1;
          health -= 10;
          if (health <= 0){
            health = 0;
          }
        }else if (hit_top <= x && x <= hit_bottom) {
          rNotes.remove(0);
          goodkey++;
          score += 50;
          combo++;
          judge = 2;
          health -= 6;
          if (health <= 0){
            health = 0;
          }
        } else if  (hit_top - 50 <= x && x <= hit_bottom + 100){
          rNotes.remove(0);
          misskey++;
          score += 0;
          combo = 0;
          judge = 3;
          health += 6;
          if (health >= 800){
            //stopAll();
          }
        } 
      }
    }
  }
  void keyPressed(){
      /** RED **/
    if (key == 'u' && !rPressed){
      //beatpress.trigger();
      r_press = true;
      r_time = 7;
      judge("red");
      rPressed = true;
    }
    /** GREEN **/
    if (key == 'i' && !gPressed){
      //beatpress.trigger();
      g_press = true;
      g_time = 7;
      judge("green");
      gPressed = true;
    }
    /** BLUE **/
    if (key == 'o' && !bPressed){
      //beatpress.trigger();
      b_press = true;
      b_time = 7;
      judge("blue");
      bPressed = true;
    }
    /** YELLOW **/
    if (key == 'p' && !yPressed){
      //beatpress.trigger();
      y_press = true;
      y_time = 7;
      judge("yellow");
      yPressed = true;
    }      
   }
}

class WindowManage extends WindowAdapter{
  
  public WindowManage(){
    
  }
  public WindowManage( PApplet _subApp ){
    subApp = _subApp;
  }
  
  public void windowClosed(WindowEvent e) {   
    subApp.noLoop();
    subApp.getSurface().stopThread();
  }
}
