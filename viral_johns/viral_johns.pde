import controlP5.*;

ControlP5 cp5;

int myColor = color(255);

int c1,c2;

float n,n1;
import java.io.File;
import http.requests.*;
XML xml;
int lnknumber= 0;
String internetlink="www.google.fr" ;
String request ="test";
String url = "http://" + "chat.com";
String url1 = "http://" + "www.twitter.com";
PImage img; 
int index=105;
int xxx;
String  dd="414141";
void setup(){
size(800,600);
img = loadImage("http://www.bhbengineers.com/wp/wp-content/themes/bhb/img/bhb-large.png");
// create a new button with name 'buttonA'

   cp5 = new ControlP5(this);
  
  // create a new button with name 'buttonA'
  cp5.addButton("colorA")
     .setValue(0)
     .setPosition(100,80)
     .setSize(200,19)
     ;
  }
 

void draw(){
   //image(img, 0, 0);
   background(0);
  fill (250,0,0);  
   text(url, 10, 10, 70, 80);  // Text wraps within text box
   
   text(dd, 100, 100, 400, 400);  // Text wraps within text box
   
   image(img, 20,20);
   

/*
  for (int i = 0; i < children.length; i++) {
    int id = children[i].getInt("id");
    String coloring = children[i].getString("species");
    String name = children[i].getContent();
    println(id + ", " + coloring + ", " + name);
  }*/
   
}


   public void colorA(int theValue) {

//  println(loadStrings(url));
/* String lines[] =loadStrings(url);
 String foo = join(lines, " : "); 
  println(foo);*/
  
    //  xml = loadXML("https://aeon.co/feed.rss");
       
       xml = loadXML("http://www.americansforthearts.org/blog/arts%20education/rss.xml");
       xml = loadXML(" https://www.arretsurimages.net/emissions-asi.rss");
       
         xml = loadXML("   https://aeon.co/feed.rss");
       
    
  //XML[] children = xml.getChildren("animal");
 
         println(xml);
    // Load RSS feed  
    String url = "https://aeon.co/feed.rssl";  
    XML rss =  xml;
    // Get title of each element  
    XML[] titleXMLElements = rss.getChildren("channel/item/title");  
    for (int i = 0; i < titleXMLElements.length; i++) {  
        String title = titleXMLElements[i].getContent();  
        println(i + ": " + title);  
    }   
    
      XML[] descXMLElements = rss.getChildren("channel/item/description");  
      String tigtle =  descXMLElements[3].getContent();  
     println(tigtle);  
     
     
    String foo  =tigtle;  
if(foo.indexOf("jpg")<=100000)
{index=foo.indexOf("jpg",0)+3;
  println("Foundin foo!"+foo.indexOf("jpg",index) );
 String  candidates  = foo.substring((foo.indexOf("jpg"))-10,(foo.indexOf("jpg"))); 
println(candidates);
}else println("no Foundin foo!");



if(foo.indexOf("src=")<=100000)
{index=foo.indexOf("src=",0)+3;
  println("Foundin foo!"+foo.indexOf("src=",index) );
 String  candidates  = foo.substring((foo.indexOf("src="))+5,(foo.indexOf(".jpg")+4)); 
println("##########"+candidates+"####");
img = loadImage(candidates);
}else println("no Foundin foo!");



     dd=tigtle;
  println("  image1");

  /*9
int time = millis();
/*if(foo.indexOf("jpg")<=100000)
{index=0;
  println("Foundin foo!"+foo.indexOf("jpg",0) );
}else println("no Foundin foo!");


if(foo.indexOf("jpg")<=100000)
{index=foo.indexOf("jpg",0)+3;
  println("Foundin foo!"+foo.indexOf("jpg",index) );
}else println("no Foundin foo!");



String  candidates  = foo.substring((foo.indexOf("jpg"))-10,(foo.indexOf("jpg"))); 
println(candidates);
 candidates  = foo.substring(foo.indexOf("jpg",index) -10,foo.indexOf("jpg",index) ); 
println(candidates);

 img = loadImage(url+"/images/boatpics/paint_120.jpg");
 img = loadImage(url+"/images/boatpics/"+candidates+"jpg");
*/
//java.io.File folder = new java.io.File(url);
/*
String[][] m = matchAll(foo, "img src=(.*?)png");
 //String  candidates[] = match(foo,"*.jpg");
//for(int u=0; u<10;u++) 


String hh =  m[xxx][0].substring(0,m[1][0].length() ); 
println(hh+"  image1");
hh = hh.replace("img src=\"","");
println(hh+"  image1");

img = loadImage(url+hh);
  redraw();
  */
}