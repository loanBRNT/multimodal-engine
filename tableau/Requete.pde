class Requete {
  RequeteClic rc=null;
  RequeteForme rf=null;
  RequeteVocal rv=null;
  RequeteClic rcAlt=null;
  
  boolean formeInRequete(){ //on regarde si une forme a ete donnee dans la commande vocale
    if (rv != null) return ((rf != null) || (rv.shape != "none") || (rv.action == "DEL"));
    return (rf != null); 
  }
  
  boolean vocalInRequete(){
    return rv!=null;
  }
  
  boolean clicInRequete(){
    if (rv != null){
     if (rv.action == "MOVE"){
      return rc!=null || rcAlt!=null; 
     }
    }
    return rc!=null;
  }
  
  //NE PAS APPELLER SANS AVOIR FAIT CLICINREQUETE AVANT
  void ajouterClic(RequeteClic r){
    if (rc != null) {
      rcAlt=null;
    } else {
     rc = r;
    }
  }
  
  void ajouterVocal(RequeteVocal r){
     rv = r; 
  }
  
  void ajouterForme(RequeteForme r){
     rf = r; 
  }
  
  //A modifier selon comment la requete doit etre valider (actuellement 1 voc, 1 forme, 1 clic)
  boolean estPrete() {
    if (rv != null) {
      if (rv.action == "CREATE") return rc != null && ((rf != null) || rv.shape != "none");
      if (rv.action == "DEL") return rc != null;
      if (rv.action == "MOVE") return rc != null && rcAlt != null;
    }
   return false;
  }
  
  String toString(){
     String s = "{";
     if (rv != null) s = s + " rv=" + rv.toString();
     if (rf != null) s = s + " rf=" + rf.toString();
     if (rc != null) s = s + " rc=" + rc.toString();
     return s + " }";
  }
}
