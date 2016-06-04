class Pist {
  private int x,y,z;
  public int rx=0,ry=0,rz=0,rv=-10,mx=0,my=0;
  
  public int w = 182;
  public int h = 244;
  public int d = 10;
  public int out = 30;
  private int goalw = 60;
  private int goald = 7;
  private int goalz = 10;
  private int goalk = 1;
  private int penaltyw = 90;
  private int penaltyh = 30;
  private int circler = 60;
   
  private int walld = 2;
  private int wallh = 24;
  public color pistColor = #328105;
  public color pistBody = #3D3E3D;
  public color goalA = #7C8103;
  public color goalB = #032B81;
  public color goalA2 = #939502;
  public color goalB2 = #0035A5;
  public int stroke = 2;
  public int antialias = 8;
  
  public color F = color(100,200,100);
  public color G = color(200,100,100);
  
  public float err = 1.0;   
  public int tscale = 1;
  
  void setScale(int scale)
  {
    w *= scale;
    d *= scale;
    h *= scale;
    out *= scale;
    goalw *= scale;
    goald *= scale;
    goalz *= scale;
    penaltyw *= scale;
    penaltyh *= scale;
    circler *= scale;
    walld *= scale;
    wallh *= scale;
    stroke *= scale;
    goalk *= scale;
    tscale = scale;
  }
  
  class Robot {
    private int pr = 10;
    private int ph = 15;
    public int px = 0;
    public int py = 0;
    public color co;
    
    void draw() {  
        fill(co);
        stroke(co);
        strokeWeight(1);
        cylinder(px,py-pr*tscale/2,int(d + err),pr*tscale,pr*tscale,ph*tscale,12 + antialias*2);
    }
  }
  
  Robot RobotF = new Robot();
  Robot RobotG = new Robot();
  
  void dotranslate(int _x,int _y,int _z)
  {
    x = _x + mx;
    y = _y + my;
    z = _z + rv;
    translate(x,y,z);
  }
  
  void untranslate()
  {
    translate(-x,-y,-z);
  }
  
  void draw()
  {    
    dotranslate(width/2,height/2,0);    
    rotateX(radians(rx));
    rotateY(radians(ry));
    rotateZ(radians(rz));    
    stroke(pistBody);    
    fill(pistBody);
    box(w,h,d);    
    untranslate();
    
    dotranslate(width/2 - w/2,height/2,wallh/2 - d/2);
    stroke(pistBody);    
    fill(pistBody);
    box(walld,h,wallh);    
    untranslate();
    
    dotranslate(width/2 + w/2,height/2,wallh/2 - d/2);
    stroke(pistBody);    
    fill(pistBody);
    box(walld,h,wallh);    
    untranslate();
    
    dotranslate(width/2 + w/2,height/2,wallh/2 - d/2);
    stroke(pistBody);    
    fill(pistBody);
    box(walld,h,wallh);    
    untranslate();
    
    dotranslate(width/2,height/2 - h/2,wallh/2 - d/2);
    stroke(pistBody);    
    fill(pistBody);
    box(w,walld,wallh);    
    untranslate();
    
    dotranslate(width/2,height/2 + h/2,wallh/2 - d/2);
    stroke(pistBody);    
    fill(pistBody);
    box(w,walld,wallh);    
    untranslate();
    
    dotranslate(width/2,height/2,int(d/2 + err));
    fill(pistColor);
    rect(-w/2,-h/2,w,h);
    noFill();
    stroke(0);
    strokeWeight(stroke);
    ellipse(0,0,circler,circler);
    
    stroke(200);
    line(-w/2 + out,-h/2 + out,+w/2 - out,-h/2 + out);
    line(-w/2 + out,-h/2 + out,-w/2 + out,h/2 - out);
    line(-w/2 + out,h/2 - out,+w/2 - out,h/2 - out);
    line(w/2 - out,h/2 - out,+w/2 - out,-h/2 + out);
    
    untranslate();
    
    dotranslate(width/2,height/2 - h/2 + out - goald,int(d + err));
    stroke(goalA);    
    fill(goalA);
    box(goalw,goalk,goalz);    
    untranslate();
    dotranslate(width/2,height/2 - h/2 + out - goald/2 + goalk,int(d + err) + goalz/2);
    stroke(goalA2);    
    fill(goalA2);
    box(goalw,goalk,goalk);    
    untranslate();
    dotranslate(width/2 - goalw/2,height/2 - h/2 + out - goald/2,int(d + err));
    stroke(goalA);    
    fill(goalA);
    box(goalk,goald,goalz);    
    untranslate();
    dotranslate(width/2 + goalw/2,height/2 - h/2 + out - goald/2,int(d + err));
    stroke(goalA);    
    fill(goalA);
    box(goalk,goald,goalz);    
    untranslate();
    
    dotranslate(width/2,height/2 + h/2 - out + goald,int(d + err));
    stroke(goalB);    
    fill(goalB);
    box(goalw,goalk,goalz);    
    untranslate();    
    dotranslate(width/2,height/2 + h/2 - out + goald/2 - goalk,int(d + err) + goalz/2);
    stroke(goalB2);    
    fill(goalB2);
    box(goalw,goalk,goalk);    
    untranslate();
    dotranslate(width/2 - goalw/2,height/2 + h/2 - out + goald/2,int(d + err));
    stroke(goalB);    
    fill(goalB);
    box(goalk,goald,goalz);    
    untranslate();
    dotranslate(width/2 + goalw/2,height/2 + h/2 - out + goald/2,int(d + err));
    stroke(goalB);    
    fill(goalB);
    box(goalk,goald,goalz);    
    untranslate();       
  }
  
  void cylinder(int xpi,int ypi,int zpi,float bottom, float top, float h, int sides)
  {
    dotranslate(xpi,int(ypi + h/2),zpi);
    
    float angle;
    float[] x = new float[sides+1];
    float[] z = new float[sides+1];
    
    float[] x2 = new float[sides+1];
    float[] z2 = new float[sides+1];
  
    for(int i=0; i < x.length; i++){
      angle = TWO_PI / (sides) * i;
      x[i] = sin(angle) * bottom;
      z[i] = cos(angle) * bottom;
    }
    
    for(int i=0; i < x.length; i++){
      angle = TWO_PI / (sides) * i;
      x2[i] = sin(angle) * top;
      z2[i] = cos(angle) * top;
    }
    
    beginShape(QUAD_STRIP);    
    for(int i=0; i < x.length; i++){
      vertex(z[i], x[i], -h/2);
      vertex(z2[i], x2[i], h/2);
    }   
    endShape();
    
    beginShape(TRIANGLE_FAN);  
    vertex(0,   h/2,    0);
   
    for(int i=0; i < x.length; i++){
      vertex(z2[i], x2[i], h/2);
    }    
    endShape();
    
    untranslate();
  }
}