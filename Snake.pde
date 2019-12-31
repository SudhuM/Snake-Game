import java.util.Random;
import java.util.ArrayList;
class Snake {
  PVector snakepos = new PVector(0,0);
  int xspeed,yspeed,total =0;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  void SnakeVal() {
    xspeed=1;
    yspeed = 0;
    snakepos.x = width/2;
    snakepos.y = new Random().nextInt(rows)*scl;
  }
  void snakeCreation() {
    strokeWeight(1);
    stroke(0,0,0);
    fill(0,255,0);
    for(PVector v : tail){
    rect(v.x, v.y, scl, scl);
  }
  rect(snakepos.x, snakepos.y, scl, scl);
 }
  void Update() {
    if (total > 0) {
      if (total == tail.size() && !tail.isEmpty()){
        tail.remove(0);
    }
      tail.add(new PVector(snakepos.x, snakepos.y));
    }
    snakepos.x += xspeed*scl;
    snakepos.y  += yspeed*scl;
  }
  boolean Death() { 
   for(int i=0 ; i< tail.size();i++){
       PVector pos = tail.get(i);
       float d = dist(snakepos.x,snakepos.y,pos.x,pos.y);
       if(d < 1){
         total = 0;
         tail.clear();
         return true;
       }
    }
    if (snakepos.x > width-scl || snakepos.x < 0|| snakepos.y > height-scl || snakepos.y < 0)    return true;
    else    return false;
  }
  void dir(int x, int y) {
    xspeed = x;
    yspeed =y;
  }
}