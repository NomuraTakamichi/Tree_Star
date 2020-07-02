import ddf.minim.*;

Minim minim;
AudioPlayer player;
float time;


void setup()
{
  size(300, 300);
  background(0);
  minim = new Minim(this);
  player = minim.loadFile("Set it all free .mp3");
  player.loop();
}

void draw()
{
  time = millis() / 10.0;
  buildaMap();
}

void keyReleased()
{
  key = 0;
}

void buildaMap()
{
  switch(key)
  {
  case'j':
    key = 0;
    println("r "+int(time));
    break;
  case'k':
    key = 0;
    println("b "+int(time));
    break;
  case'l':
    key = 0;
    println("g "+int(time));
    break;
  case';':
    key = 0;
    println("y "+int(time));
    break;
  }
}
