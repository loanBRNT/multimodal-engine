import java.util.ArrayList;
import java.util.List;

class RequeteVocal {
  String text;
  float confidence;
  List<String> create = new ArrayList<>();
  List<String> couleur = new ArrayList<>();
  List<String> forme = new ArrayList<>();
  List<String> objet = new ArrayList<>();
  List<String> suppr = new ArrayList<>();
  List<String> position = new ArrayList<>();
  List<String> bouger = new ArrayList<>();
  List<String> quitter = new ArrayList<>();
  String action = "none";
  String colour = "none";
  String pos = "none";
  String shape = "none";
  
  RequeteVocal(String text, float conf){
    this.text = text;
    this.confidence = conf;
    
    this.fillList();
    
    this.affectation();
  }
  
  void fillList(){
    create.add("créer");
    create.add("dessiner");
    create.add("tracer");
    
    couleur.add("bleu");
    couleur.add("rouge");
    couleur.add("vert");
    couleur.add("orange");
    couleur.add("jaune");
    couleur.add("violet");
    couleur.add("noir");
    
    forme.add("triangle");
    forme.add("rectangle");
    forme.add("losange");
    forme.add("cercle");
    
    objet.add("ça");
    objet.add("cette forme");
    
    suppr.add("supprimer");
    suppr.add("effacer");
    
    position.add("ici");
    position.add("là");
    position.add("à cet endroit");

    bouger.add("bouger");
    bouger.add("déplacer");
    
    quitter.add("quitter");
    quitter.add("sortir");
    quitter.add("arrêter");

  }
  
  void affectation(){
    for ( String i : create){
      if(this.text.contains(i)){
        this.action = "CREATE";
      }
    }
    
    for(String i : couleur){
      if(this.text.contains(i)){
        this.colour=i;
      }}
      
    for ( String i : forme){
      if(this.text.contains(i)){
        this.shape = i;
      }
    }
    
    for ( String i : suppr){
      if(this.text.contains(i)){
        this.action = "DEL";
      }
    }
    
    for ( String i : objet){
      if(this.text.contains(i)){
        this.shape = "THIS";
      }
    }
    
    for ( String i : bouger){
      if(this.text.contains(i)){
        this.action = "MOVE";
      }
    }
    
    for ( String i : quitter){
      if(this.text.contains(i)){
        this.action = "QUIT";
      }
    }
    
    for ( String i : position){
      if(this.text.contains(i)){
        this.pos = "HERE";
      }
    }
  }
  
  boolean isValid() {
    
   return colour != "none"; 
  }
  
  color getColor(){
   switch(colour){
    
   case "bleu": return color(0,0,255);
   
   case "rouge": return color(255,0,0);
   
   case "jaune": return color(255,255,0); 
   
   case "vert": return color(0,255,255); 
   
   case "violet": return color(255,0,255); 
   
   case "noir": return color(0,0,0);
   
   case "orange": return color(255,128,0); 
   
   default: return color(255,255,255); 
    
  } 
  }
  
  String toString(){
    return "Action=" + action + " couleur=" + colour + " pos=" + pos + " shape=" + shape;
  }
}
