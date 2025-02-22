import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
SawWave saw;

int wave = 0;

boolean audioEnabled = false;

void audioSetup() {
  minim = new Minim(this);
  out = minim.getLineOut();
  switch(wave) {
  case 0:
    sine = new SineWave(440, 0.5, out.sampleRate());

    sine.portamento(200);
    out.addSignal(sine);
    break;
  case 1:
    saw = new SawWave(660, 0.5, out.sampleRate());
    saw.portamento(200);
    out.addSignal(saw);
    break;
  }
}

void ToggleAudio() {
  if (audioEnabled == true) {
    audioEnabled = false;
    println("audio disabled");
  } else {
    audioEnabled = true;
    println("audio enabled");
  }
}

void audioPlay() {

  float frequency = colorToFrequency(colorR, colorG, colorB);
  float volume = map(colorA, 0, 255, 0, 1);
  switch(wave) {
  case 0:
    sine.setFreq(frequency);
    sine.setAmp(volume);
    break;

  case 1:
    saw.setFreq(frequency);
    saw.setAmp(volume);
    break;
  }
}

float colorToFrequency(int r, int g, int b) {
  return 440 + (r * 0.1) + (g * 0.2) + (b * 0.3);
}
