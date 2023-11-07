import java.util.function.BiFunction;

class ListeRequete {
  
  ArrayList<Requete> listeRequete = new ArrayList<Requete>();
  
  //ajotue une forme a la premiere requete Generale de la liste qui n'a pas deja une requete forme
  void receiveForme(String text, float conf){
    boolean ajouter = false;
    RequeteForme rf = new RequeteForme(text,conf);
    if (rf.isValid()){
      System.out.println(rf.toString());
      for (int i=0; i<listeRequete.size();i++){
      if (listeRequete.get(i).ajouterForme(rf)) {
        ajouter = true;
        break;
      }
    }
    
    if (!ajouter) {
      Requete r = new Requete();
      r.ajouterForme(rf);
      listeRequete.add(r);
    }
    }    
  }
  
  //ajotue un voc a la premiere requete Generale de la liste qui n'a pas deja une requete vocal
  void receiveVocal(String text, float conf){
    boolean ajouter = false;
    RequeteVocal rv = new RequeteVocal(text,conf);
    BiFunction<Requete, RequeteVocal, Boolean> func;
    switch (rv.action){
            case "CREATE":
                func = rv.formeInVocal() ? Requete::ajouterVocalCREATE_Forme : Requete::ajouterVocalCREATE_SansForme;
                break;
            case "MOVE":
                func = Requete::ajouterVocalMOVE;
                break;
            case "DEL":
                func = Requete::ajouterVocalDEL;
                break;
            default:
                System.out.println("Action non valide: " + rv.action);
                return;
        }
    System.out.println(rv.toString());
    for (int i=0; i<listeRequete.size();i++){
        if (func.apply(listeRequete.get(i), rv)) {
                ajouter = true;
                break;
            }
        else {
           if (listeRequete.get(i).vocalInRequete()) {
            listeRequete.remove(i);
            i--;
           }
        }
     }
      
     if (!ajouter) {
        Requete r = new Requete();
        func.apply(r, rv);
        listeRequete.add(r);
     }
  }
  
  //ajoute un clic a la premiere requete Generale de la liste qui n'a pas deja une requete Clic
  void addClick(int x, int y, Forme f){
    boolean ajouter = false;
    RequeteClic rc = new RequeteClic(x,y);
    String s = "Clic recu " + rc.x + " " + rc.y;
    if (f!=null) {s = s + "sur une forme";}
    System.out.println(s);
    for (int i=0; i<listeRequete.size();i++){
      if (f!=null) {
        if (listeRequete.get(i).ajouterClicSurForme(f)){ 
          ajouter = true;
          break;
        }
      } else {
        if (listeRequete.get(i).ajouterClic(rc)){ 
          ajouter = true;
          break;
        }
      }
    }
    
    if (!ajouter) {
      Requete r = new Requete();
      if (f==null) {r.ajouterClic(rc);}
      else {r.ajouterClicSurForme(f);}
      listeRequete.add(r);
    }
  }  
  
  //Check si une requete de la liste est prete, sinon renvoie null, si oui la retire de la liste et la renvoie
  Requete checkRequetePrete(){
     Requete r = null;
    for(int i=0; i < listeRequete.size() ; i++){
      if (listeRequete.get(i).estPrete()) {
        r = listeRequete.get(i);
        listeRequete.remove(i);
       break; 
      }
    }
    
    return r;
  }

  String toString(){
   String s = "";
    for (Requete r : listeRequete){
     s = s + "-" + r.toString() + "\n";
    }
    return s;
  }
  
}
