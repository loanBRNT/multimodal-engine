import fr.dgac.ivy.*;

Ivy bus;
FSM mae;
int nbFormes = 0;
ListeRequete listeRequete = new ListeRequete();
ListeForme listeForme = new ListeForme();

//Se fait au demarage
void setup() {
  size(1200, 800);
  background(255);
  smooth();
  surface.setTitle("Ecran");
  try {
      bus = new Ivy("Tableau", "Tableau est pret", null);
      bus.start("127.255.255.255:2010");
      bus.bindMsg("^sra5 Text=(.*) Confidence=(.*)",new IvyMessageListener() {
        public void receive(IvyClient client, String[] args) {
                    if (keyPressed){
                      if (key == 'a' || key == 'A') {
                        String s = args[1].replace(",",".");
                        listeRequete.receiveVocal(args[0],float(s));
                      }
                    }
                    
                }});
      bus.bindMsg("^OneDollarIvy Template=(.*) Confidence=(.*)",new IvyMessageListener() {
        public void receive(IvyClient client, String[] args) {
                    String s = args[1].replace(",",".");
                    listeRequete.receiveForme(args[0],float(s));
                }});
    }
    catch (IvyException ie) {}
}

//Fonction pour analyser une requete complete
void analyser(Requete r) {
  //Récupération des requetes
   Forme forme;
   System.out.println(r.toString());
 
 switch (r.state){
   
   case SEPT: listeForme.supprimerForme(r.clickSurForme); break;
   
   case HUIT:
     forme = new Forme(r.rv.shape, r.rc.x, r.rc.y, r.rv.getColor());
     listeForme.ajouterForme(forme);
     break;
   
   case ONZE:
     forme = new Forme(r.rf.getForme(), r.rc.x, r.rc.y, r.rv.getColor());
     listeForme.ajouterForme(forme);
     break;
   
   case QUATORZE: listeForme.deplacerForme(r.clickSurForme,r.rc.x,r.rc.y); break;
     
   default: throw new IllegalArgumentException("Requete non valide: " + r.toString());
 }
}

//Fonction de dessins des formes stockées.
void dessiner(ListeForme list) {
  if (list.estNonVide()){
    list.draw();
  }
}

//Fonction periodique
void draw() {
    Requete r = listeRequete.checkRequetePrete();
    if (r != null) {
        analyser(r);
        background(255);
        dessiner(listeForme);
    }
}

void mouseClicked() {
  int x = mouseX;
  int y = mouseY;
  
  Forme f = listeForme.getForme(x,y);
  
  listeRequete.addClick(x,y,f);
}

void keyPressed() {
  if (key=='l' || key=='L') System.out.println("Liste requete :\n" + listeRequete.toString());
}
