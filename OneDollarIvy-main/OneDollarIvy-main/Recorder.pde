/*
 * Simple class to record Points
 *
 */
 
import java.io.Serializable;

class Recorder implements Serializable {
  Point [] points;
  boolean recording;
  boolean hasPoints;

  Recorder() {
     points = new Point[0];
     recording = false;
  }

  void update() {
    if (recording) {
      if (mousePressed) {
        points = (Point[])append(points, new Point(mouseX, mouseY));
      }
      else {
        recording = false;
        if( points.length > 5) {
          hasPoints = true;
        }
      }
    }
    else {
      if(mousePressed) {
        points = new Point[0];
        recording = true;
        hasPoints = false;
      }
    }
  }

  void draw( ) {
     color c = color(0,0,0); // Dark
     if(recording) {
       c = color(7, 128, 237); // Blue
     }
     if(points.length > 1) {
       for( int i = 1; i < points.length; i++) {
         stroke(c);
         line( points[i-1].X, points[i-1].Y,
               points[i].X, points[i  ].Y);
       }
     }
  }
}
