import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.* ;
import org.jbox2d.dynamics.* ;

Box2DProcessing mundo;
int s=0;
ArrayList <Limite> suelo;
PImage lab;
Pelota una;
float x1,y1;

void setup(){
  size(600,600);
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  lab=loadImage("lab1.png");
  suelo= new ArrayList<Limite>();
  suelo.add(new Limite(159,22.5,14,35));
  suelo.add(new Limite(178.5,77.5,53,15));
  suelo.add(new Limite(211,45,12,80));
  suelo.add(new Limite(272.5,38,27,12));
  suelo.add(new Limite(293,24.5,14,39));
  suelo.add(new Limite(418.5,38,153,12));
  suelo.add(new Limite(322.5,77.5,127,15));
  suelo.add(new Limite(392.5,77,13,66));
  suelo.add(new Limite(437.5,62,15,36));
  suelo.add(new Limite(135.5,116,61,12));
  suelo.add(new Limite(278,116,160,12));
  suelo.add(new Limite(462.5,116,65,12));
  suelo.add(new Limite(182.5,156.5,154,13));
  suelo.add(new Limite(266.5,155,15,66));
  suelo.add(new Limite(402,156.6,186,13));
  suelo.add(new Limite(455,182.5,14,39));
  suelo.add(new Limite(123.5,195,37,14));
  suelo.add(new Limite(294.5,195,245,14));
  suelo.add(new Limite(307,216,14,28));
  suelo.add(new Limite(350,236,16,68));
  suelo.add(new Limite(440.5,236,109,12)); 
  suelo.add(new Limite(189.5,236,169,12)); 
  suelo.add(new Limite(266.5,262.5,15,41)); // 
  suelo.add(new Limite(169,276.5,128,13)); 
  suelo.add(new Limite(385.5,276.5,153,13)); 
  suelo.add(new Limite(123.5,315,37,14)); 
  suelo.add(new Limite(261,315,162,14)); 
  suelo.add(new Limite(378.5,317,15,68)); 
  suelo.add(new Limite(435.5,315,37,14)); 
  suelo.add(new Limite(488,315,16,14)); 
  suelo.add(new Limite(182,358,154,14)); 
  suelo.add(new Limite(294,358.5,12,73)); 
  suelo.add(new Limite(376,358,68,14)); 
  suelo.add(new Limite(467,358,56,14)); 
  suelo.add(new Limite(446.5,336.5,15,29)); 
  suelo.add(new Limite(300,397.5,400,7)); 
  suelo.add(new Limite(300,2.5,400,5)); 
  suelo.add(new Limite(100,200,9,400)); 
  suelo.add(new Limite(500,200,9,400)); 
  una = new Pelota(123,380,10);
}

void draw(){
  switch(s){
    case 0:
       background(255,255,0);
       textSize(40);
       text("Maze Lab",200,100);
       
       pushMatrix();
       rectMode(CORNER);
       fill(255,0,0);
       rect(150,275,300,30);
       textSize(20);
       fill(0);
       text("INSTRUCCIONES Presione(1)",150,300);
       popMatrix();
       
       pushMatrix();
       rectMode(CORNER);
       fill(255,125,0);
       textSize(20);
       rect(150,325,300,30);
       fill(0);
       text("INICIAR Presione(2)",150,350);
       popMatrix();
       
       
       if (keyPressed) {
    if (key == '1') {
      s=1;
    }
    else if (key == '2'){
      s=2;
    }
   }
       
       break;
         
      case 1:
      background(0,0,255);
      text("mueve la pelota con las teclas WASD ",100,100);
      text("para llegar hasta la meta. ",100,130);
      text("para regresar presione (R)",50,500);
      
    if (keyPressed) {
    if (key == 'r' || key == 'R') {
      s=0;
  
  }
  }
      break;
      
    case 2:
       background(0);
       mundo.step();
       rectMode(CORNER);
       fill(255,0,0,99.8);
       rect(466,5,30,27);
       textSize(10);
       fill(255);
       text("META",467,20);
       image(lab,98.5,-2.5);
       una.display();
       
       if (x1>466&&x1<496&&y1>5&&y1<33)
  {
  s=3;
  }
    break; 
    
       case 3:
       background(0);
       textSize(40);
       fill(255);
       text("FELICITACIONES",150,100);
       text("GANASTE",220,200);
      break;
  }
  return;
}

void keyPressed(){
  
  
    if (keyPressed) {
    if (key == 'a' || key == 'A') {
      mundo.setGravity(-20,0);
    }
    if (key == 'd' || key == 'D') {
      mundo.setGravity(20,0);
    }
    if (key == 'w' || key == 'W') {
      mundo.setGravity(0,20);
    }
    if (key == 'S' || key == 's') {
      mundo.setGravity(0,-20);
    }
    }
}
