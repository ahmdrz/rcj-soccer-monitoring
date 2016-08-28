import controlP5.*;
ControlP5 cp5;
Println console;
Textarea myTextarea;
Pist pist = new Pist();

class Screen {
  public int width = 0;
  public int height = 0;
}

Screen old = new Screen();

color backcolor = color (100,100,100);
PFont ayric;

int icounter = 0;
int jcounter = 0;
int lcounter = 250;
int kcounter = 0;
float pcounter = 1.0;
int imax = 80;
String totalName = "Ayric Robotic Team Production";
int rectSize;
boolean startProgram = true;
boolean startZooming = true;

int positionx = 0;
int positiony = 0;

void setup()
{  
  fullScreen(P3D,SPAN);
  smooth(8);
  cp5 = new ControlP5(this);
  cp5.enableShortcuts();
  
  ayric = loadFont("Ubuntu-32.vlw");
  old.width = width;
  old.height = height;
  
  myTextarea = cp5.addTextarea("console")
                  .setPosition(0, height + height/10)
                  .setSize(0, 0)
                  .setFont(createFont("", 10))
                  .setLineHeight(10)
                  .setColor(color(200))
                  .setColorBackground(color(0, 100))
                  .setColorForeground(color(255, 100));
  
  console = cp5.addConsole(myTextarea).setMax(3);  
}

void draw()
{
  background(backcolor);
  if (!startProgram)
  {   
    icounter+=pcounter*3;
    if (icounter < 1395/2) pcounter+=0.085;
    else if (icounter <= 1395) pcounter-=0.085;
    rectSize = height > width ? width/4 : height/4;
    imax = 1395 + rectSize/4;
    
    pushMatrix();
    translate(width/2,icounter < 1395 ? height/2 : icounter < imax ? height/2 - (icounter-1395) : height/2 - rectSize/4,0);
    rotateZ(radians(icounter < 1395 ? icounter : 1395));
    rotateY(radians(icounter > 1395*1.1 && jcounter < 90*2 ? jcounter++ : jcounter));
    rotateX(radians(icounter > 1395*1.1 && jcounter < 90*2 ? 180-(jcounter++) : jcounter));
    noFill();
    stroke(0);
    strokeWeight(rectSize/10);
    rect(-rectSize/2,-rectSize/2,rectSize,rectSize,rectSize/10,rectSize/10,rectSize/10,rectSize/10);  
    popMatrix();
   
    pushMatrix();
    translate(width/2,icounter < 1395 ? height/2 : icounter < imax ? height/2 + (icounter-1395) : height/2 + rectSize/4,0);
    rotateZ(radians(icounter < 1395 ? icounter : 675)); 
    rotateY(radians(icounter > 1395*1.1 && jcounter < 90*2 ? 180-(jcounter++) : jcounter));
    rotateX(radians(icounter > 1395*1.1 && jcounter < 90*2 ? (jcounter++) : jcounter));
    noFill();
    stroke(0);
    strokeWeight(rectSize/10);
    rect(-rectSize/2,-rectSize/2,rectSize,rectSize,rectSize/10,rectSize/10,rectSize/10,rectSize/10);
    popMatrix();
    
    if (jcounter >= 180) {
      textAlign(CENTER,CENTER);
      textSize(rectSize/6);
      text(totalName.substring(0,totalName.length() > kcounter ? kcounter++ : kcounter),width/2,height/2 + rectSize*1.5);
    }
           
    if (kcounter == totalName.length()) {
      if (lcounter == 0)
      {
        myTextarea.setPosition(0, height - height/10).setSize(width, height/10);
        console.setMax((height/10) / 10);        
        println("Loading...");
        startProgram = true;
      }
      lcounter-=5;
    }
  }
  else 
  {    
    if (startZooming)
    {
      pist.rv+=2;
      pist.rx++;      
      if (pist.rx > 60)
      {
        startZooming = false;
        println("Welcome to Ayric::SoccerMonitoring");
        println("Programmer : AhmadrezaZibaei");
        println("Special thanks to : ENG.HamidNematBaksh & Reza Mahzoonie"); 
      }
    }    
    
      if (old.width != width || old.height != height) 
      {
        myTextarea.setPosition(0, height - height/10).setSize(width, height/10);
        console.setMax((height/10) / 10);
      }      
      pushMatrix();
      pist.draw();
      
        pist.ball.x = width/2 + positionx;
        pist.ball.y = height/2 + positiony;
        pist.ball.co = pist.B;
        pist.ball.draw();
        pist.RobotF.co = pist.F;
        pist.RobotF.px = width/2;
        pist.RobotF.py = height/2 + pist.h/8;
        pist.RobotF.draw();
        pist.RobotG.co = pist.G;
        pist.RobotG.px = width/2;
        pist.RobotG.py = height/2 + pist.h/4;
        pist.RobotG.draw();
        
      popMatrix();  
      
      pushMatrix();
      cp5.draw();  
      fill(0);
      textFont(ayric,height/50);
      textAlign(CENTER, CENTER);
      text("Ayric Robotic Team",width/2,height/50);  
      popMatrix();            
      
      old.width = width;
      old.height = width;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if ( key == 'z') 
    pist.rz += e*5;
  if ( key == 'x')
    pist.rx += e*5;
  if ( key == 'y')
    pist.ry += e*5;
  if ( key == 'c')
    pist.rv += e*5;
  if ( key == 'm')
    pist.mx += e*5;
  if ( key == 'n')
    pist.my += e*5;
    
  if ( key == 'w')
    positiony+=e;
  if ( key == 's')
    positiony-=e;
  if (key == 'a')
    positionx-=e;
  if (key == 'd')
    positionx+=e;
  println("Mouse Wheel : RX(" + pist.rx+") RY(" + pist.ry +") RZ(" + pist.rz +")");
}