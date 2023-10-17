import fr.dgac.ivy.*;

Ivy bus;
FSM mae;

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
                    System.out.println("Message reçu: " + args[0] + " pour " + args[1]);
                }});
    }
    catch (IvyException ie) {}
      mae = FSM.INITIAL;
      
}

void draw() {
    
}

void mouseClicked() {

}
