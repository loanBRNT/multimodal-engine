import java.util.ArrayList;
import java.util.List;

String[] create = {"créer","dessiner","tracer"};
String[] couleur = {"bleu","rouge","vert","orange","jaune","violet","noir"};
String[] forme = {"triangle","rectangle","losange","cercle"};
//String[] objet = {"ça","cette forme"};
String[] suppr = {"supprimer","effacer"};
String[] position = {"ici","là","à cet endroit"};
String[] bouger = {"bouger","deplacer"};
String[] quitter = {"quitter","sortir","arrêter"};

class RequeteVocal {
  String text;
  float confidence;
  String action = "none";
  String colour = "none";
  String pos = "none";
  String shape = "none";
  
  RequeteVocal(String text, float conf){
    this.text = text;
    this.confidence = conf;
    
    this.affectation();
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
    
    //for ( String i : objet){
    //  if(this.text.contains(i)){
      //  this.shape = "THIS";
      //}
    //}
    
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
   return action != "none";
  }
  
  color getColor(){
   switch(colour){
    
   case "bleu": return color(0,0,255);
   
   case "rouge": return color(255,0,0);
   
   case "jaune": return color(255,255,0); 
   
   case "vert": return color(0,255,0); 
   
   case "violet": return color(255,0,255); 
   
   case "noir": return color(0,0,0);
   
   case "orange": return color(255,128,0); 
   
   default: return color(0,0,0l); 
    
  } 
  }
  
  boolean formeInVocal(){
    return this.shape != "none";
  }
  
  String toString(){
    return "Action: " + action + " - Couleur: " + colour + " - Forme: " + shape;
  }
}
