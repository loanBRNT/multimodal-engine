/*
 *  OneDollarIvy -> Demonstration with ivy middleware
 * v. 1.31
 *   can import/export templates
 * 
 * (c) Ph. Truillet, October 2020
 * Last Revision: 13/07/2022
 * 
 * $1 Dollar Recognizer - http://depts.washington.edu/aimgroup/proj/dollar/
*/


import fr.dgac.ivy.*;
import javax.swing.JOptionPane;

// Attributes
Ivy bus;
FSM mae;

color ORANGE = color(255,127,0);

float Infinity = 1e9;

// Recognizer class constants
int NumTemplates = 16;
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
  surface.setTitle("Gesture Recognizer");
  surface.setLocation(50,50);
  sketch_icon = loadImage("onedollar.jpg");
  surface.setIcon(sketch_icon);
  
  result = null;
  s_result = "";
  
  recognizer = new Recognizer();
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
    mae = FSM.INITIAL;
}

void draw() {
  // MAE à ajouter
  switch (mae) {
    case INITIAL:
      background(255);
      fill(0);
      text("Press (R) for gesture recognition\n\n(L) to learn gesture\n(E) to export templates\n(I) to import templates\n(T) to display Templates name\n(H) for help",50,50);  
      break;
      
    case RECOGNITION:
      background(255);
      textAlign(LEFT);
      fill(0);
      text(s_result, 10, 10);
            
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
      break;
      
    case LEARNING: // have to register points first
      background(ORANGE);
      recorder.update();
      recorder.draw();
      
      if (recorder.hasPoints) {
        Point[] points = recorder.points;
        String template = JOptionPane.showInputDialog("Give a name to your template: ");
        recognizer.AddTemplate(template, points);
        recorder.hasPoints = false;
        mae = FSM.RECOGNITION;
      }
      break;
      
    case IMPORT:
      recognizer.Import();
      mae = FSM.RECOGNITION;
      break;
      
    case EXPORT: 
      recognizer.Export();
      mae = FSM.RECOGNITION;
      break;
      
    case TEMPLATES:
      String[] tn = recognizer.getTemplatesName();
      background(255);
      fill(0);
      text("REGISTERED TEMPLATES", 20,10);
      for (int i=0;i<tn.length;i++)
        text(tn[i], 50, i*20+30);
      break;
      
    case HELP:
      background(255);
      fill(0);
      text("Press (R) for gesture recognition\n\n(L) to learn gesture\n(E) to export templates\n(I) to import templates\n(T) to display Templates name\n(H) for help",50,50);  
      break;
      
    default:
      break;
  }
}

void keyPressed() {
  switch (key) {
    case 'r': // RECOGNITION -  default state
    case 'R':
      mae = FSM.RECOGNITION;
      break;
      
    case 'l': // LEARNING new template
    case 'L':
      mae = FSM.LEARNING;
      break;
      
    case 'e': // EXPORT templates
    case 'E':
      mae = FSM.EXPORT;
      break;
      
      case 'h': // HELP
      case 'H':
      mae = FSM.HELP;
      break;
           
    case 'i': // IMPORT templates
    case 'I':    
      mae = FSM.IMPORT;
      break; 
      
    case 't': // display TEMPLATES
    case 'T':    
      mae = FSM.TEMPLATES;
      break;  
    
    case ' ': // SPACEBAR
      switch (mae) {
        case TEMPLATES:
          mae = FSM.RECOGNITION;
          break;

        case HELP:
          mae = FSM.RECOGNITION;
          break;  
          
        default:
          break;
      }
      break;
  }
}
