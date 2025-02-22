import themidibus.*; //Import the library

MidiBus midiBus; // The MidiBus

void midiCreateBus()
{
  midiBus = new MidiBus(this, 1, 4);
}



//canviar aquest valor segons el number del primer fader
final int midiFaderAddress = 77;
final int midiEffectsAddress = 1;
//final int midiModeAddress = 0;
final int midiImageAddress = 40;


//Aquesta funció s'executa cada vegada que el programa rep informació MIDI
void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange


  //Segons el valor de 'number', canviar una variable o una altra
  switch (number) {
  case midiFaderAddress:
    posX = int(map(value, 0, 127, 0, width));
    break;

  case midiFaderAddress + 1:
    posY = int(map(value, 0, 127, 0, height));
    break;

  case midiFaderAddress + 2:
    scaleX = int(map(value, 0, 127, 0, width));
    break;

  case midiFaderAddress + 3:
    scaleY = int(map(value, 0, 127, 0, height));
    break;

  case midiFaderAddress + 4:
    colorR = value * 2;
    break;

  case midiFaderAddress + 5:
    colorG = value * 2;
    break;

  case midiFaderAddress + 6:
    colorB = value * 2;
    break;

  case midiFaderAddress + 7:
    //colorA = value * 2;
    density = int(value/2)+1;
    break;

  case midiFaderAddress + 8:
    bevel = float(value)/127*1000;
    break;

  case midiFaderAddress + 9:
    density = int(value/2)+1;
    break;
  }

  if (channel == 2) {
    switch(number) {
      //Efectes
    case midiEffectsAddress:
      filterThreshold = float(value)/127*2;
      break;

    case midiEffectsAddress + 1:
      filterBlur = float(value)/127;
      break;
    }
  }

  //Debug info MIDI
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
}

void noteOn(int channel, int pitch, int velocity) {

  if (pitch == midiImageAddress) {
    SetImatge(pitch-midiImageAddress);
  }

  if (channel == 0) {
    switch(pitch) {
    case 0:
      SetDrawMode(0);
      break;
    case 72:
      SetDrawMode(1);
      break;
    case 75:
      SetDrawMode(2);
      break;
      case 76:
      SetDrawMode(3);
      break;
    default:
      break;
    }
  }


  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {

  /*
  // Receive a noteOff
   println();
   println("Note Off:");
   println("--------");
   println("Channel:"+channel);
   println("Pitch:"+pitch);
   println("Velocity:"+velocity);
   */
}
