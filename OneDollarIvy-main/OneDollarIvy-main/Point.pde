/*
 * Définition d'un Point - et méthodes associées
 */ 
 
class Point {
  float X;
  float Y;
  
  Point(float x, float y) {
    X = x;
    Y = y;
  }

  float distance(Point other) {
    return dist(X, Y, other.X, other.Y);
  }
}
