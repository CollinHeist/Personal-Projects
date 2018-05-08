import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
BeatDetect beat;
BeatListener bl;

float secondScale = 3;    //Number of seconds per ticker
int circleSize = 500;  //600 is max
int circleRad = circleSize/2;
int Y_AXIS = 1, X_AXIS = 2, timeElapsed = 0, timesCounted = 0;
float runningAverage = 0;
color b1 = color(0, 0, 0);
color b2 = color(9, 56, 72);
int time = millis();

float degPerSec, songLength;

class BeatListener implements AudioListener {
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps) {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR) {
    beat.detect(source.mix);
  }
}

void setup() {
  size(1200, 750);
  frameRate(60);
  noFill();
  strokeWeight(2.5);

  minim = new Minim(this);

  // specify 512 for the length of the sample buffers the default buffer size is 1024
  song = minim.loadFile("Casimir Pulaski Day.mp3", 512);
  song.play();

  // an FFT needs to know how long the audio buffers it will be analyzing are
  // and also needs to know the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());

  // Gradient Background
  setGradient(0, 0, width, height, b1, b2, X_AXIS);

  float songLength = song.length() / (secondScale * 1000);    //Number of tickers
  float degPerSec = 360.0/songLength;    //Number of degrees per second

  /* First Ellipse, the largest one */
  drawEllipse(circleSize);    //Function to draw ellipses
  drawLines(degPerSec, songLength, circleRad);    //Function to draw segmenting lines

  /* Second Ellipse, the second-largest one */
  //drawEllipse(circleSize/2+circleSize/6);
  //drawLines(degPerSec, songLength, (circleSize/2+circleSize/6)/2);

  /* Third Ellipse, the smallest one */
  //drawEllipse(circleSize/4+circleSize/12);
  //drawLines(degPerSec, songLength, (circleSize/4+circleSize/12)/2);
}

void draw() {
  if (millis() >= time + 1000) { timeElapsed++; time = millis(); println(timeElapsed);  }//Increments second(s)

  //Start old visualization
  fft.forward(song.mix);

  stroke(255, 0, 0, 128);
  strokeWeight(2);
  // draw the spectrum as a series of vertical lines. I multiply the value of 
  // getBand by 4 so that we can see the lines better
  for (int i = 0; i < fft.specSize(); i++, timesCounted++) {runningAverage += fft.getBand(i);}

  if ((timeElapsed % secondScale == 0) && (timeElapsed != 0)) {
    runningAverage /= timesCounted;
    visualize(degPerSec, runningAverage);
    runningAverage = 0;
    timesCounted = 0;
  }
}

void visualize(float degPerSec, float runningAverage) {
  stroke(255, 255, 255, 55); //Alpha was 55
  float degVal = degPerSec * ((timeElapsed-1) / secondScale);  //Degree value of where to draw
  float startX = 0, startY = 0, endX = 0, endY = 0;

  if (degVal >= 0 && degVal <= 90) {
    startX = (width/2) +(circleRad*sin(radians(degVal)));
    startY = (height/2)-(circleRad*cos(radians(degVal)));
    endX   = (width/2) +((circleRad+(runningAverage*75))*sin(radians(degVal)));
    endY   = (height/2)-((circleRad+(runningAverage*75))*cos(radians(degVal)));
  } else if (degVal > 90 && degVal <= 180) {
    startX = (width/2) +(circleRad*sin(radians(180-degVal)));
    startY = (height/2)+(circleRad*cos(radians(180-degVal)));
    endX   = (width/2) +((circleRad+runningAverage*75)*sin(radians(180-degVal)));
    endY   = (height/2)+((circleRad+runningAverage*75)*cos(radians(180-degVal)));
  } else if (degVal > 180 && degVal <= 270) {
    startX = (width/2) -(circleRad*sin(radians(degVal-180)));
    startY = (height/2)+(circleRad*cos(radians(degVal-180)));
    endX   = (width/2) -((circleRad+runningAverage*75)*sin(radians(degVal-180)));
    endY   = (height/2)+((circleRad+runningAverage*75)*cos(radians(degVal-180)));
  } else if (degVal > 270 && degVal <= 360) {
    startX = (width/2) -(circleRad*sin(radians(360-degVal)));
    startY = (height/2)-(circleRad*cos(radians(360-degVal)));
    endX   = (width/2) -((circleRad+runningAverage*75)*sin(radians(360-degVal)));
    endY   = (height/2)-((circleRad+runningAverage*75)*cos(radians(360-degVal)));
  }
  line(startX, startY, endX, endY);
  //rect(startX, startY, endX-startX, endY-startY);    //Parameter c and d are widths and lengths
}

void drawLines(float degPerSec, float songLength, int circleRad) {
  stroke(255, 255, 255, 218);    //White
  float startX = 0, startY = 0, endX = 0, endY = 0, degCount = 0;

  for (int secCount = 0; secCount < songLength; secCount++) {
    if (degCount >= 0 && degCount <= 90) {
      startX = (width/2) +((circleRad-3)*sin(radians(degCount)));
      startY = (height/2)-((circleRad-3)*cos(radians(degCount)));
      endX   = (width/2) +((circleRad+3)*sin(radians(degCount)));
      endY   = (height/2)-((circleRad+3)*cos(radians(degCount)));
    } else if (degCount > 90 && degCount <= 180) {
      startX = (width/2)+((circleRad-3)*sin(radians(180-degCount)));
      startY = (height/2)+((circleRad-3)*cos(radians(180-degCount)));
      endX   = (width/2)+((circleRad+3)*sin(radians(180-degCount)));
      endY   = (height/2)+((circleRad+3)*cos(radians(180-degCount)));
    } else if (degCount > 180 && degCount <= 270) {
      startX = (width/2)-((circleRad-3)*sin(radians(degCount-180)));
      startY = (height/2)+((circleRad-3)*cos(radians(degCount-180)));
      endX   = (width/2)-((circleRad+3)*sin(radians(degCount-180)));
      endY   = (height/2)+((circleRad+3)*cos(radians(degCount-180)));
    } else if (degCount > 270 && degCount <= 360) {
      startX = (width/2)-((circleRad-3)*sin(radians(360-degCount)));
      startY = (height/2)-((circleRad-3)*cos(radians(360-degCount)));
      endX   = (width/2)-((circleRad+3)*sin(radians(360-degCount)));
      endY   = (height/2)-((circleRad+3)*cos(radians(360-degCount)));
    }

    line(startX, startY, endX, endY);
    degCount += degPerSec;
  }
}

void drawEllipse(int circleSize) {
  ellipse(width/2, height/2, circleSize, circleSize);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {
  noFill();
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
