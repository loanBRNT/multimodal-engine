import fr.dgac.ivy.*;

Ivy bus;
FSM mae;

void setup() {
  size(1200, 800);
  surface.setTitle("Ecran");
  try {
      bus = new Ivy("Tableau", "Tableau est pret", null);
      bus.start("127.255.255.255:2010");
    }
    catch (IvyException ie) {}
      mae = FSM.INITIAL;
}
