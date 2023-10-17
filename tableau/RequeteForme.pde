public class RequeteForme {
    private String forme;
    private float score;

    public RequeteForme(String forme, float score) {
        this.forme = forme.replaceAll("[^a-zA-Z]", "");
        this.score = score;
    }

    public String getForme() {
        return forme;
    }

    public float getScore() {
        return score;
    }

    public String toString() {
        return "Forme: " + forme + ", Score: " + score;
    }
    
    boolean isValid() {
     return (score > 0.6) && (forme != "NONE"); 
    }
}
