class ListeRequete {
  
  ArrayList<Requete> listeRequete = new ArrayList<Requete>();
  
  //ajotue une forme a la premiere requete Generale de la liste qui n'a pas deja une requete forme
  void receiveForme(String text, float conf){
    boolean ajouter = false;
    RequeteForme rf = new RequeteForme(text,conf);
    if (rf.isValid()){
      System.out.println(rf.getForme() + "recu ");
      for (int i=0; i<listeRequete.size();i++){
      if (!listeRequete.get(i).formeInRequete()) {
        listeRequete.get(i).ajouterForme(rf);
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
    if (rv.isValid()){
      System.out.println(rv.colour + "recu ");
      for (int i=0; i<listeRequete.size();i++){
        if (!listeRequete.get(i).vocalInRequete()) {
          listeRequete.get(i).ajouterVocal(rv);
          ajouter = true;
          break;
        }
      }
      
      if (!ajouter) {
        Requete r = new Requete();
        r.ajouterVocal(rv);
        listeRequete.add(r);
      }
    } 
  }
  
  //ajoute un clic a la premiere requete Generale de la liste qui n'a pas deja une requete Clic
  void addClick(int x, int y){
    boolean ajouter = false;
    RequeteClic rc = new RequeteClic(x,y);
    System.out.println("Clic recu " + rc.x + " " + rc.y);
    for (int i=0; i<listeRequete.size();i++){
      if (!listeRequete.get(i).clicInRequete()) {
        listeRequete.get(i).ajouterClic(rc);
        ajouter = true;
        break;
      }
    }
    
    if (!ajouter) {
      Requete r = new Requete();
      r.ajouterClic(rc);
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
  
}
