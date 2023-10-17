class ListeRequete {
  
  int taille;
  Requete[] listeRequete;
  
  public ListeRequete(int t){
    taille = t;
    listeRequete = new Requete[t];
  }
  
  void receiveForme(String text, float conf){
    boolean ajouter = false;
    RequeteForme rf = new RequeteForme(text,conf);
    for (int i=0; i<taille;i++){
      if (!listeRequete[i].formeInRequete()) {
        listeRequete[i].ajouterForme(rf);
        ajouter = true;
        break;
      }
    }
    
    if (!ajouter) {
      Requete r = new Requete();
      r.ajouterForme(rf);
    }
      
  }
  
  void receiveVocal(String text, float conf){
    boolean ajouter = false;
    RequeteVocal rv = new RequeteVocal(text,conf);
    for (int i=0; i<taille;i++){
      if (!listeRequete[i].vocalInRequete()) {
        listeRequete[i].ajouterVocal(rv);
        ajouter = true;
        break;
      }
    }
    
    if (!ajouter) {
      Requete r = new Requete();
      r.ajouterVocal(rv);
    }
      
  }
  
  
  
  
  
}
