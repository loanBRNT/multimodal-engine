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
  
  boolean estPrete() {
   return rc != null && rf != null && rv != null; 
  }
}
