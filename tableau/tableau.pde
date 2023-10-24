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
   int x = r.rc.x;
   int y = r.rc.y;
   color couleur = r.rv.getColor();
   
  //fonctionnement de la MAE qui nous récupère selon l'interprétation les variables forme, x, y ,couleur
  if (r.rv.action == "CREATE") {
    String shape;
    if (r.rv.shape != "none") {
      shape = r.rv.shape;
    }else{
      shape = r.rf.getForme();
    }
  //Créer la forme reçu
   Forme forme = new Forme(shape, x, y, couleur);
  //Stocke dans le tableau
   listeForme.ajouterForme(forme);
  }
  
 if (r.rv.action == "DEL") {
  //Supprimer dans le tableau
   listeForme.supprimerForme(x,y);
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
  listeRequete.addClick(mouseX,mouseY);
}

void keyPressed() {
  if (key=='l' || key=='L') System.out.println("Liste requete :\n" + listeRequete.toString());
}
