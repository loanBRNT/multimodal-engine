public class Forme {
    private String forme;
    private float x;
    private float y;
    private color couleur;

    // Constructeur prenant la forme (sous forme de chaîne), les coordonnées x et y (float) et la couleur (sous forme de chaîne) en paramètres
    public Forme(String forme, float x, float y, color couleur) {
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
    public float getX() {
        return x;
    }

    // Getter pour obtenir la coordonnée y
    public float getY() {
        return y;
    }

    // Getter pour obtenir la couleur
    public color getCouleur() {
        return couleur;
    }

    // Méthode pour afficher la forme sous forme de chaîne (utile pour le débogage)
    public String toString() {
        return "Forme: " + forme + ", Coordonnées (x, y): (" + x + ", " + y + "), Couleur: " + couleur;
    }
}
