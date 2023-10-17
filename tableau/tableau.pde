import fr.dgac.ivy.*;

Ivy bus;
FSM mae;

ListeRequete listeRequete = new ListeRequete();

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
                    String s = args[1].replace(",",".");
                    listeRequete.receiveVocal(args[0],float(s));
                }});
      bus.bindMsg("^OneDollarIvy Template=(.*) Confidence=(.*)",new IvyMessageListener() {
        public void receive(IvyClient client, String[] args) {
                    String s = args[1].replace(",",".");
                    listeRequete.receiveForme(args[0],float(s));
                }});
    }
    catch (IvyException ie) {}
      mae = FSM.INITIAL;
      
}

//Fonction pour dessiner une requete complete
void dessiner(Requete r) {
  String forme = r.rf.getForme();
   
  fill(r.rv.getColor());
  
  switch(forme){
   case "rectangle": rect(r.rc.x,r.rc.y,200,100); break;
   
   //case "losange": System.out.println("Losange");  break;
   
   case "cercle": circle(r.rc.x,r.rc.y,100);  break;
   
   //case "triangle": System.out.println("Triangle");  break;
   
   default: System.out.println("Autre");  break;
    
  }
}

//Fonction periodique
void draw() {
    Requete r = listeRequete.checkRequetePrete();
    if (r != null) {
        r.debug();
        dessiner(r);
    }
}

void mouseClicked() {
  listeRequete.addClick(mouseX,mouseY);
}
