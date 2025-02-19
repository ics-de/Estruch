import themidibus.*; //Import the library

MidiBus midiBus; // The MidiBus

boolean scaleMidiToDmx = true;

boolean isReceivingMidi = false;


void midiCreateBus(/*int midiIn, int midiOut*/)
{
  midiBus = new MidiBus(this, 1, 4);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange

  MidiControllerChange(channel, number, value);
}

void MidiControllerChange(int channel, int number, int value)
{
  //x = value/width;
  //println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  //ConsolePrint("CC: " + channel + " | " + number + " | " + value);
}

void noteOn(int channel, int pitch, int velocity) {
  
  
  // Receive a noteOn
  //println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  
  
  // Receive a noteOff
  //println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}
