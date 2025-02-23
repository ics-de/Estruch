import themidibus.*; //Import the library

MidiBus midiBus; // The MidiBus

void midiCreateBus()
{
  midiBus = new MidiBus(this, 1, 4);
}



//canviar aquest valor segons el number del primer fader
final int midiFaderAddress = 57;
final int midiEffectsAddress = 1;
final int midiModeAddress = 73;
final int midiImageAddress = 40;
final int midiButtonAddress = 105;
final int midiFader2Address = 1;


//Aquesta funció s'executa cada vegada que el programa rep informació MIDI
void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange


  switch(channel) {
  case 8:
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
      colorA = value * 2;
      break;
    case midiFader2Address:
      bevel = float(value)/127*2000;
      break;

    case midiFader2Address+1:
      densityX = int(value/2)+1;
      break;
    case midiFader2Address+2:
      densityY = int(value/2)+1;
      break;
    case midiFader2Address+3:
      spacingX = value;
      break;
      case midiFader2Address+4:
      spacingY = value;
      break;
      case midiFader2Address+5:
      rotation = float(value)/127*360;
      break;
    }
    break;

  case 2:
    switch(number) {
      //Efectes
    case midiEffectsAddress:
      filterThreshold = float(value)/127*2;
      break;

    case midiEffectsAddress + 1:
      filterBlur = float(value)/127;
      break;
    }
    break;
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


  if (channel == 0) {
    switch(pitch) {
    case midiModeAddress:
      SetDrawMode(0);
      break;
    case midiModeAddress+1:
      SetDrawMode(1);
      break;
    case midiModeAddress+2:
      SetDrawMode(2);
      break;
    case midiModeAddress+3:
      SetDrawMode(3);
      break;

    case midiImageAddress:
      SetImatge(0);
      break;
    case midiImageAddress+1:
      SetImatge(1);
      break;
    case midiImageAddress+2:
      SetImatge(2);
      break;
    case midiImageAddress+3:
      SetImatge(3);
      break;

    case midiButtonAddress:
      if (isMain) {
        GeneratePrompt();
      }
      break;
    case midiButtonAddress+1:
      //Clear();
      //oscSendClear();
      break;
    case midiButtonAddress+2:
      break;
    case midiButtonAddress+3:
      //Screenshot();
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
