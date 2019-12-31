                      // @ author Sudharshan M
                        // SNAKE GAME
Snake s;
PImage img;
PVector food;
boolean isRight = true,isUp = false,isLeft = false,isDown = false,gameMode = false; 
int rows,cols,keyCount =0,scl =10;
void setup() {
  size(480,360); 
  frameRate(12);
  rows = height/scl;
  cols = width/scl;
  s= new Snake();
  s.SnakeVal();
  food =  new PVector((1+new Random().nextInt(cols))*scl, (1+new Random().nextInt(rows))*scl);
  img = loadImage("snake.jpg");
}
void draw() {
  if(!gameMode){
    image(img,0,0,width,height);
    textAlign(CENTER);
    textFont(createFont("Times New Roman",20));
    fill(255);
    text("click to play the game",width/2,height-35);
  }
  else{
  background(0);
  textSize(14); fill(150,90,255);  /* ---> */ text("Score: "+ s.tail.size(), 35, 20);
  if (s.Death()) {
    textAlign(CENTER);
    textSize(26);  fill(150,150,50);  /* ---> */ text("Game Over!!!", width/2, height/4); 
    textSize(20); fill(255, 150, 0);  /* ---> */ text("Your Score is: "+ s.tail.size(), width/2, height/4+40); 
    textSize(16);   fill(255);  /* ---> */ text("Press space to Exit", width/2, height/2+25);  
    /* --> */ text(" Press Enter to play Again.", width/2, height/2);
    s.snakepos.x =0;  s.snakepos.y =0;s.xspeed=1;s.yspeed =0;
    s.tail.clear();
    s.total = 0;
    noLoop();
  }
  else{
    s.snakeCreation();
    s.Update();
    Food();
  float distance  = dist(s.snakepos.x, s.snakepos.y, food.x, food.y);
  if (distance == 0) {
    s.total++;
    FoodLocation();
    }
   }
  }
}
void Food() {
  noStroke();
  fill(255, 0, 0);
  rect(food.x, food.y, scl, scl);
}
void FoodLocation() {
  food.x= new Random().nextInt(cols)*scl;
  food.y= new Random().nextInt(rows)*scl; 
  println("Location Picked at " + food.x + " " + food.y );
}
void mouseClicked(){
  gameMode = true;
}
void keyPressed() {
  if ((keyCode == UP || key == 'w') && !isDown ) {
    s.dir(0, -1);
    isUp = true; isRight = false; isLeft = false;
  } else  if ((keyCode == DOWN || key == 'x')  && !isUp ) {
    s.dir(0, 1);
    isDown = true; isLeft = false; isRight = false;
  } else  if ((keyCode == LEFT || key == 'a') && !isRight) {
    s.dir(-1, 0);
    isUp = false;  isDown = false;  isLeft = true;
  } else if ( (keyCode == RIGHT  || key == 'd' ) && !isLeft) {
    s.dir(1, 0);
    isUp = false;  isDown = false;  isRight = true;
  }
  if (keyCode == ' ') {
      println("Game Exited!!");
      exit();
  } else if (keyCode == ENTER){
     s.SnakeVal();
     loop();
}
    else if(key == 'r'){
      keyCount++;
      if(keyCount %2 ==0){
      loop();  
   }else{
    // image(img,0,0,width,height);
     textSize(20);
     fill(255,0,0);
     text("Game Resumed..  Press R to Resume back\n Press Space to Exit",width/2,height/2);
       noLoop();
     }
 }
}