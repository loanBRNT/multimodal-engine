import fr.dgac.ivy.*;
import javax.swing.JOptionPane;

// Attributes
Ivy bus;

float Infinity = 1e9;

// Recognizer class constants
int NumTemplates = 4;
int NumPoints = 64;
float SquareSize = 250.0;
float HalfDiagonal = 0.5 * sqrt(250.0 * 250.0 + 250.0 * 250.0);
float AngleRange = 45.0;
float AnglePrecision = 2.0;
float Phi = 0.5 * (-1.0 + sqrt(5.0)); // Golden Ratio

Recognizer recognizer;
Recorder recorder;
Result result;
String s_result;

PFont font;
PImage sketch_icon;

void setup() {
  size(400, 250);
  surface.setTitle("Vous pouvez déssinez ici pour ajouter une forme au tableau blanc");
  surface.setLocation(850,50);
  sketch_icon = loadImage("onedollar.jpg");
  surface.setIcon(sketch_icon);
  
  result = null;
  s_result = "";
  
  recognizer = new Recognizer();
  recognizer.Import();
  recorder = new Recorder();
  
  smooth();
  font = loadFont("TwCenMT-Regular-16.vlw");
  textFont(font);
  
  // === START WITH NO TEMPLATES ===
  try {
    bus = new Ivy("OneDollarIvy", " OneDollarIvy is ready", null);
    bus.start("127.255.255.255:2010");
  }
  catch (IvyException ie) {}
}

void draw() {
      background(255);
      //textAlign(LEFT);
      fill(0);
      //text(s_result, 10, 10);
            
      recorder.update();
      recorder.draw();
      
      if (recorder.hasPoints) {
        Point[] points = recorder.points;
        result = recognizer.Recognize(points);
        recorder.hasPoints = false;
      }

      if( result != null) {
        s_result = "Template: "+ result.Name + "\nScore: " + String.format("%.2f",result.Score);
        
        try {
          bus.sendMsg("OneDollarIvy Template=" + result.Name + " Confidence=" + String.format("%.2f",result.Score));
        }
        catch (IvyException ie) {}
        result=null;
       }
}
