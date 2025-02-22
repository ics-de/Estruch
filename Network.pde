import oscP5.*;
import netP5.*;


OscP5 oscP5;
NetAddress ipMiguel;
NetAddress ipOriol;
NetAddress ipClaudia;

void oscSetUp() {
  oscP5 = new OscP5(this, 12000);

  ipMiguel = new NetAddress("192.168.50.18", 12000);
  ipOriol = new NetAddress("192.168.50.20", 12000);
  ipClaudia = new NetAddress("192.168.1.73", 12000);
}

void oscSend() {
  if (isMain) {
    OscMessage oscMessage = new OscMessage("/game");

    oscMessage.add("screenshot");

    /* send the message */
    oscP5.send(oscMessage, ipMiguel);
    oscP5.send(oscMessage, ipOriol);
    oscP5.send(oscMessage, ipClaudia);
  }
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  if (!isMain) {
    Screenshot();

    if (theOscMessage.get(0).stringValue() == "screenshot") {
    }
  }
}
