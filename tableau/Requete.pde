class Requete {
  RequeteClic rc=null;
  RequeteForme rf=null;
  RequeteVocal rv=null;
  Forme clickSurForme=null;
  
  FSM state = FSM.ZERO;
  
  boolean ajouterClic(RequeteClic r){
    switch (state){
      
     case ZERO: state = FSM.UN; break;
     
     case DEUX: state = FSM.QUINZE; break;
     
     case QUATRE: state = FSM.TREIZE; break;
     
     case CINQ: state = FSM.HUIT; break;
      
     case SIX: state = FSM.DIX; break;
     
     case NEUF: state = FSM.ONZE; break;
     
     case DOUZE: state = FSM.QUATORZE; break;
     
     case SEIZE: state = FSM.DIX_SEPT; break;
     
     default: return false;
      
    }
    rc = r;
    return true;
  }
  
  boolean ajouterClicSurForme(Forme f){
    switch (state){
      
     case ZERO: state = FSM.DEUX; break;
     
     case UN: state = FSM.QUINZE; break;
     
     case TROIS: state = FSM.SEPT; break;
     
     case QUATRE: state = FSM.DOUZE; break;
     
     case TREIZE: state = FSM.QUATORZE; break;
     
     default: return false;
      
    }
     clickSurForme = f;
     return true;
  }
  
  boolean ajouterVocalCREATE_Forme(RequeteVocal r){
    switch (state){
      
     case ZERO: state = FSM.CINQ; break;
     
     case UN: state = FSM.HUIT; break;
     
     default: return false;
      
    }
     rv = r;
     return true;
  }
  
  boolean ajouterVocalCREATE_SansForme(RequeteVocal r){
    switch (state){
      
     case ZERO: state = FSM.SIX; break;
     
     case UN: state = FSM.DIX; break;
     
     case SEIZE: state = FSM.NEUF; break;
     
     case DIX_SEPT: state = FSM.ONZE; break;
     
     default: return false;
      
    }
     rv = r;
     return true;
  }
  
  boolean ajouterVocalMOVE(RequeteVocal r){
    switch (state){
      
     case ZERO: state = FSM.QUATRE; break;
     
     case DEUX: state = FSM.DOUZE; break;
     
     case UN: state = FSM.TREIZE; break;
     
     case QUINZE: state = FSM.QUATORZE; break;
     
     default: return false;
      
    }
     rv = r;
     return true;
  }
  
  boolean ajouterVocalDEL(RequeteVocal r){
    switch (state){
      
     case ZERO: state = FSM.TROIS; break;
     
     case DEUX: state = FSM.SEPT; break;
     
     default: return false;
      
    }
     rv = r;
     return true;
  }
  
  boolean ajouterForme(RequeteForme r){
    switch (state){
      
      case ZERO: state = FSM.SEIZE; break;
      
      case SIX: state = FSM.NEUF; break;
      
      case DIX: state = FSM.ONZE; break;
      
      case UN: state = FSM.DIX_SEPT; break;
      
     default: return false; 
    }
     rf = r;
     return true;
  }
  
  boolean estPrete() {
    if (state == FSM.SEPT || state == FSM.HUIT || state == FSM.ONZE || state == FSM.QUATORZE) {
      return true;
    }
   return false;
  }
  
  String toString(){
     String s = "{ state=" + state;
     if (rv != null) s = s + " rv=" + rv.toString();
     if (rf != null) s = s + " rf=" + rf.toString();
     if (rc != null) s = s + " rc=" + rc.toString();
     if (clickSurForme != null) s = s + " Forme=" + clickSurForme.toString();
     return s + " }";
  }
}
