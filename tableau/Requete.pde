class Requete {
  RequeteClic rc=null;
  RequeteForme rf=null;
  RequeteVocal rv=null;
  
  boolean formeInRequete(){
    return (rf == null);
  }
  
  boolean vocalInRequete(){
    return rv==null;
  }
  
  void ajouterVocal(RequeteVocal r){
     rv = r; 
  }
  
  void ajouterForme(RequeteForme r){
     rf = r; 
  }
}
