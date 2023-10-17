import fr.dgac.ivy.*;

Ivy bus;
FSM mae;

ListeRequete listeRequete = new ListeRequete();

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

void dessiner(Requete r) {
  String forme = r.rf.getForme();
   
  switch(r.rv.colour){
    
   case "bleu": fill(0,0,255);  break;
   
   case "rouge": fill(255,0,0);  break;
   
   case "jaune": fill(255,255,0);  break;
   
   case "vert": fill(0,255,255);  break;
   
   case "violet": fill(255,0,255);  break;
   
   case "noir": fill(0,0,0);  break;
   
   case "orange": fill(255,128,0);  break;
   
   default: fill(255,255,255); System.out.println("def");  break;
    
  }
  
  switch(forme){
   case "rectangle": rect(r.rc.x,r.rc.y,200,100); break;
   
   //case "losange": System.out.println("Losange");  break;
   
   case "cercle": circle(r.rc.x,r.rc.y,100);  break;
   
   //case "triangle": System.out.println("Triangle");  break;
   
   default: System.out.println("Autre");  break;
    
  }
}

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
