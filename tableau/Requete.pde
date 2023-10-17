class Requete {
  RequeteClic rc=null;
  RequeteForme rf=null;
  RequeteVocal rv=null;
  
  boolean formeInRequete(){
    return (rf != null);
  }
  
  boolean vocalInRequete(){
    return rv!=null;
  }
  
  boolean clicInRequete(){
    return rc!=null;
  }
  
  void ajouterClic(RequeteClic r){
     rc = r; 
  }
  
  void ajouterVocal(RequeteVocal r){
     rv = r; 
  }
  
  void ajouterForme(RequeteForme r){
     rf = r; 
  }
  
  //A modifier selon comment la requete doit etre valider (actuellement 1 voc, 1 forme, 1 clic)
  boolean estPrete() {
   return rc != null && rf != null && rv != null;
  }
  
  void debug(){
     System.out.println("forme=" + rf.getForme() + " x=" + rc.x + " y=" + rc.y + " color=" + rv.colour); 
  }
}
