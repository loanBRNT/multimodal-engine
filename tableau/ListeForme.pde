import processing.core.PApplet;

public class ListeForme {
    public ArrayList<Forme> formes;

    // Constructeur prenant l'objet PApplet en paramètre
    public ListeForme() {
        formes = new ArrayList<>();
    }

    // Méthode pour ajouter une forme à la liste
    public void ajouterForme(Forme forme) {
        formes.add(forme);
        System.out.println("forme ajoutée");
    }

    // Méthode pour dessiner toutes les formes
    public void draw() {
        for (Forme forme : formes) {
            fill(forme.getCouleur()); // Utilisation de la couleur de la forme
            // Dessin de la forme en fonction du type de forme
            switch (forme.getForme()) {
                case "cercle":
                    circle(forme.getX(),forme.getY(),100);
                    break;
                case "losange":
                    float halfDiagonal = 75; // Longueur de la moitié de la diagonale du losange (ajustez selon vos besoins)
                    beginShape();
                    vertex(forme.getX(), forme.getY() - halfDiagonal); // Sommet supérieur
                    vertex(forme.getX() + halfDiagonal, forme.getY()); // Coin droit
                    vertex(forme.getX(), forme.getY() + halfDiagonal); // Coin inférieur
                    vertex(forme.getX() - halfDiagonal, forme.getY()); // Coin gauche
                    endShape(PApplet.CLOSE);
                    break;
                case "triangle":
                    float height = 100 * sqrt(3) / 2; // Hauteur d'un triangle équilatéral
                    beginShape();
                    vertex(forme.getX(), forme.getY() - height / 2); // Sommet supérieur
                    vertex(forme.getX() + 50, forme.getY() + height / 2); // Coin droit
                    vertex(forme.getX() - 50, forme.getY() + height / 2); // Coin gauche
                    endShape(PApplet.CLOSE);
                    break;
                case "rectangle":
                    rectMode(PApplet.CENTER);
                    rect(forme.getX(), forme.getY(), 200, 100);
                    break;

                default:
                    // Forme non reconnue mais ne devrait pas arriver
                    break;
            }
        }
    }
    
     // Méthode pour vérifier si le tableau de formes n'est pas vide
    public boolean estNonVide() {
        return !formes.isEmpty();
    }
    
    public String toString() {
        StringBuilder result = new StringBuilder();
        result.append("Liste des Formes:\n");
        for (Forme forme : formes) {
            result.append(forme.toString()).append("\n");
        }
        return result.toString();
    }
    
    Forme getForme(int x, int y) {
      Forme formeOverlap = null;
      for (Forme f : formes){
       if (f.surForme(x,y)){
         formeOverlap = f;
       }
      }
      return formeOverlap;
    }
    
    // Méthode pour supprimer la forme
    public void supprimerForme(int x, int y) {
      formes.remove(getForme(x,y));
    }
    
    // Méthode pour deplacer la forme
    public void deplacerForme(Forme forme, int new_x, int new_y) {
      forme.deplacer(new_x, new_y);
    }
    
}
