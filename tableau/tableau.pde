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
    }
    catch (IvyException ie) {}
      mae = FSM.INITIAL;
}

void draw() {
    
}

void mouseClicked() {
   try {
      bus.sendMsg("Tableau x=" + mouseX + " y=" + mouseY);
    }
    catch (IvyException ie) {}
}
