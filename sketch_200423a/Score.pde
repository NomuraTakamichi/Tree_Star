
public class Score{
   int score = 0,combo = 0;
   int y_re = 150;
   String result[] = new String[2];
   
   public Score(int score){
     this.score = score;
   }
   public Score(int score,int combo){
     this.score = score;
     this.combo = combo;
   }
   void draw(){
      result[0] = String.valueOf(this.score);
      result[1] = String.valueOf(this.combo);
      for(int i = 0;i<result.length;i++){
         fill(0,0,0);
         textSize(32);
         text(result[i],450,y_re);
         y_re += 150; 
      }
   }
}
