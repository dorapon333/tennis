class Area {
  void display(int x,int y,int r,int d) {
    rect(x,y,r,d);
  }
}

class MoveBall {  
  int x = 1100, y = 500;
  int size = 50;
  void display() {
    ellipse(mouseX, y, size, size);
  }
  void move() {
  }
}

class Device {
  int ob_x;
  int ob_y;
  int wp_x;
  int wp_y;
  void obstacle(){
    ellipse(ob_x, ob_y, 50, 50);
  }
  void ob_move(){
    ob_y = ob_y - 15;
    wp_y = wp_y - 7;
    
  }
  
 
  
  void warp(){
    textSize(50);
    text("Chance!", wp_x-50, wp_y-10);
    rect(wp_x, wp_y, 60,60);   
  }
}

int y=0;
int flag=0;

Area a1;
MoveBall b;
Device d;

void setup(){
  size(2000,1600);

  a1=new Area();
  b=new MoveBall();
  d=new Device();
  
  d.ob_x = 120;
  d.ob_y = 3000;
  d.wp_x = 800;
  d.wp_y = 4450;
}

void draw(){
  background(0,0,200);
  int[] rectX={1300,100,900,100,1300,100,1500,100,500,1300,100,900,100,1300,100,1200,100,500,1300,100,900,100,1300,100,1200,100};
  int[] rectY={300-y,700-y,1000-y,1200-y,1500-y,1700-y,1800-y,2000-y,2200-y,2300-y,2700-y,3000-y,3200-y,3500-y,3700-y,3800-y,4000-y,4200-y,4300-y,4700-y
                    ,5000-y,5200-y,5500-y,5700-y,5800-y,6000-y};
  int[] rectW={900,1200,1100,1050,1250,1000,850,1000,1000,900,1200,1100,1050,1250,1000,850,1000,1000,900,1200,1100,1050,1250,1000,850,1000};
  int[] rectH={100,80,90,95,110,70,50,30,50,100,80,90,95,110,70,50,30,50,100,80,90,95,110,70,50,30};
                    
  if(flag==0){

  for(int i=0;i<26;i++){
    a1.display(rectX[i],rectY[i],rectW[i],rectH[i]);
  }
  
  for(int i=0;i<26;i++){
    if(mouseClicked(rectX[i],rectY[i],rectW[i],rectH[i])){
      flag=1;
    }
  }
    
    
  
  y+=1;
  b.display();
  b.move();
  
  d.obstacle();
  d.ob_move();
  d.warp();
  }else{
    
    fill(0);
    textSize(200);
    text("Game over",500,600);
  }
  
  
}

boolean mouseClicked(int x,int y,int w,int h){
  if(  x-25<= mouseX && mouseX <=  x+w+25 &&  y-25  <= 500 && 500 <= (y+h+25)  ){
      return true;
    }
    else{
      return false;
    }

}
  
