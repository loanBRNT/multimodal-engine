public class Forme {
    private String forme;
    private int x;
    private int y;
    private color couleur;

    // Constructeur prenant la forme (sous forme de chaîne), les coordonnées x et y (float) et la couleur (sous forme de chaîne) en paramètres
    public Forme(String forme, int x, int y, color couleur) {
        this.forme = forme;
        this.x = x;
        this.y = y;
        this.couleur = couleur;
    }

    // Getter pour obtenir la forme
    public String getForme() {
        return forme;
    }

    // Getter pour obtenir la coordonnée x
    public int getX() {
        return x;
    }

    // Getter pour obtenir la coordonnée y
    public int getY() {
        return y;
    }

    // Getter pour obtenir la couleur
    public color getCouleur() {
        return couleur;
    }
    
    // Méthode pour changer les coordonnées de la forme
    public void deplacer(int newX, int newY) {
        this.x = newX;
        this.y = newY;
    }

    // Méthode pour afficher la forme sous forme de chaîne (utile pour le débogage)
    public String toString() {
        return "Forme: " + forme + ", Coordonnées (x, y): (" + x + ", " + y + "), Couleur: " + couleur;
    }
    
    boolean surForme(int _x, int _y) {
      switch (forme){
       case "rectangle" : return (_x > x - 100) && (_x < x + 100) && (_y > y - 50) && (_y < y + 50);
       
       case "cercle" : return (_x > x - 50) && (_x < x + 50) && (_y > y - 50) && (_y < y + 50);
       
       case "losange" : return (_x > x - 75) && (_x < x + 75) && (_y > y - 75) && (_y < y + 75);
       
       case "triangle" : return (_x > x - 50) && (_x < x + 50) && (_y > y - 50) && (_y < y + 50);
          
        default: return false;
      }     
    }
}
