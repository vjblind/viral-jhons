import controlP5.*;
import processing.awt.PSurfaceAWT;
import processing.awt.PSurfaceAWT.SmoothCanvas;
ControlP5 cp5;
boolean  mr=false;
Url[] url=new Url[10] ;
PSurface initSurface() {
  PSurface pSurface = super.initSurface();
   ( (SmoothCanvas) ((PSurfaceAWT)surface).getNative()).getFrame().setLocation(0, 0);
  //( (SmoothCanvas) ((PSurfaceAWT)surface).getNative()).getFrame().setUndecorated(true);

  return pSurface;
}

PrintWriter output;
void setup() {
String[] lines; 


lines = loadStrings("lines.txt");
output = createWriter("lines.txt");
for (int i = 0; i <lines.length; i++) {
output.println(lines[i]);
 output.flush();
  }
println(lines+"ffff");
size(360,300);
  surface.setAlwaysOnTop(true);
frame.setBackground(new java.awt.Color(255,0,0));
cp5= new  ControlP5(this);

cp5.addTextfield ("textValue")
.setPosition(15,15)
.setSize(100,20)
.setFont(createFont("arial",12))
.setAutoClear(false)
;

cp5.addTextfield ("shearch")
.setPosition(200,15)
.setSize(100,20)
.setFont(createFont("arial",12))
.setAutoClear(false)
;


for(int x=0;x<10;x++)url[x]=new Url(50,10+-(10*x),x);
for (int i = 0; i < 10; i++) {
 url[i].urls=lines[i];
  }

}
void draw(){
background(0);
for(int x=0;x<10;x++)url[x].update();
for(int x=0;x<10;x++)url[x].draw();
mr=false;


String[] m1 = match(cp5.get(Textfield.class,"textValue").getText(),"((^|, )(part1|part2|part3))+$");
if (m1 != null) {
  text("Found a match",mouseX+10,150); } 
  
  String[] m2 = match(cp5.get(Textfield.class,"shearch").getText(),"((^|, )(part1|part2|part3))+$");
if (m2 != null) {
  link("https://www.google.fr/search?q=part1");
  text("Found a match",mouseX+10,150);  
 cp5.get(Textfield.class,"shearch").clear();
  
  }
}




class Url{
  int id;
PVector loc =new PVector (1,20); 
PVector speed =new PVector (1,20);
PVector acc =new PVector (1,20);
float t;
int counter;
String textValue = "";

 
String urls;


Url(int tx,int ty,int idt){id=idt;
loc.x=tx; loc.y=ty;

 
}

void update(){t+=0.5;

  
 
if(id!=0){
loc.y =url[(id+1)%10].loc.y+10;
//loc.x =url[(id+1)%10].loc.x+20;
stroke(250);
line(loc.x ,loc.y,url[(id+1)%10].loc.x,url[(id+1)%10].loc.y);
}
//loc.x+=50*id*sin(t/50)*0.03;
fill(250);
if(dist(mouseX,mouseY,loc.x,loc.y)<10)

text(urls,10,250);
if(dist(loc.x,loc.y,url[(id+1)%10].loc.x,url[(id+1)%10].loc.y)<100){
loc.y+=10; 
//loc.y+=50*id*cos(t/40)*0.03;
//loc.x+=25*sin(t/25)*0.08;
//loc.x+=10;
}
}
void draw(){
fill(150);

//if(dist(mouseX,mouseY,loc.x,loc.y)<30)loc.y+=50*cos(t/5)*0.03;
if(dist(mouseX,mouseY,loc.x,loc.y)<30)
if ( mouseButton== LEFT && mr)
link(urls);


if(dist(mouseX,mouseY,loc.x,loc.y)<30)
if (mr &&  mouseButton== RIGHT) {

fill(250,150,150) ;
urls= cp5.get(Textfield.class,"textValue").getText(); 
String joinedAnimals =urls.toString(); 
String[] lines = new String[10];
//for (int i = 0; i < 10; i++) {
    lines[0] = urls;
  //}
  output.println(urls);
output.flush();
 mr=false ;
 // Write the remaining data
// saveStrings("lines.txt",lines);
//link(urls.get(counter%urls.size()));  
 }
ellipse(loc.x,loc.y,10,10);
fill(250);
//text(urls,loc.x+10,loc.y);
}

 


}


void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue() 
            );
            
          
  }
}void mouseReleased(){mr=true;}
