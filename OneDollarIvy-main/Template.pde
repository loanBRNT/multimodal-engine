/* A template holds a name and a set of reduced points that represent
 * a single gesture.
 */
 
import java.util.Stack; 

class Template {
  String Name;
  Point [] Points;
  float Infinity = 1e9; 
  
  Template( String name, Point [] points) {
    Name = name;
    Points = Resample( points, NumPoints);
    Points = RotateToZero( Points );
    Points = ScaleToSquare( Points, SquareSize);
    Points = TranslateToOrigin( Points );
  }
  
  Point [] Resample( Point [] points, int n) {
   float I = PathLength( points ) / ( (float)n -1.0 );
   float D = 0.0;
   Point [] newpoints = {};
   Stack stack = new Stack();
   for( int i = 0; i < points.length; i++) {
     stack.push( points[ points.length -1 - i]);
   }

   while( !stack.empty()) {
       Point pt1 = (Point) stack.pop();

       if( stack.empty()) {
         newpoints = (Point [])append( newpoints, pt1);
         continue;
       }
       Point pt2 = (Point) stack.peek();
       float d = pt1.distance( pt2);
       if( (D + d) >= I) {
          float qx = pt1.X + (( I - D ) / d ) * (pt2.X - pt1.X);
          float qy = pt1.Y + (( I - D ) / d ) * (pt2.Y - pt1.Y);
          Point q = new Point( qx, qy);
          newpoints = (Point [])append( newpoints, q);
          stack.push( q );
          D = 0.0;
       }
       else {
         D += d;
       }
   }

   if(newpoints.length == (n -1)) {
     newpoints = (Point [])append( newpoints, points[ points.length -1 ]);
   }
   return newpoints;
  }
  
  float PathLength( Point [] points) {
    float d = 0.0;
    for( int i = 1; i < points.length; i++) {
      d += points[i-1].distance( points[i]);
    }
    return d;
  }
  
  Point [] RotateToZero(Point [] points) {
   Point c = Centroid(points);
   float theta = atan2( c.Y - points[0].Y, c.X - points[0].X);
   return RotateBy( points, -theta);
  }
  
  Point [] RotateBy( Point [] points, float theta) {
   Point c = Centroid( points );
   float Cos = cos( theta );
   float Sin = sin( theta );

   Point [] newpoints = {};
   for( int i = 0; i < points.length; i++) {
     float qx = (points[i].X - c.X) * Cos - (points[i].Y - c.Y) * Sin + c.X;
     float qy = (points[i].X - c.X) * Sin + (points[i].Y - c.Y) * Cos + c.Y;
     newpoints = (Point[]) append(newpoints, new Point( qx, qy ));
   }
   return newpoints;
  }
  
  Point Centroid( Point [] points) {
    Point centriod = new Point(0.0, 0.0);
    for( int i = 1; i < points.length; i++) {
      centriod.X += points[i].X;
      centriod.Y += points[i].Y;
    }
    centriod.X /= points.length;
    centriod.Y /= points.length;
    return centriod;
  }
  
  Point [] ScaleToSquare( Point [] points, float sz) {
    Rectangle B = BoundingBox( points );
    Point [] newpoints = {};
    for( int i = 0; i < points.length; i++) {
       float qx = points[i].X * (sz / B.Width);
       float qy = points[i].Y * (sz / B.Height);
       newpoints = (Point [])append( newpoints,  new Point(qx, qy));
    }
    return newpoints;
  }
  
  Rectangle BoundingBox( Point [] points) {
    float minX = Infinity;
    float maxX = -Infinity;
    float minY = Infinity;
    float maxY = -Infinity;

    for( int i = 1; i < points.length; i++) {
      minX = min( points[i].X, minX);
      maxX = max( points[i].X, maxX);
      minY = min( points[i].Y, minY);
      maxY = max( points[i].Y, maxY);
    }
    return new Rectangle( minX, minY, maxX - minX, maxY - minY);
  }
  
  Point [] TranslateToOrigin( Point [] points) {
    Point c = Centroid( points);
    Point [] newpoints = {};
    for( int i = -0; i < points.length; i++) {
      float qx = points[i].X - c.X;
      float qy = points[i].Y - c.Y;
      newpoints = (Point [])append( newpoints,  new Point(qx, qy));
     }
   return newpoints;
  }  
}
