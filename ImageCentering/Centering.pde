int leftX = 0, rightX = 0, bottomY = 0, clicks = 0;
final int leftGuide = 3039;   // X-coord of Left, small scale is 604, large is 3039
final int rightGuide = 3217;  // X-coord of Right, small scale is 643, large is 3217
final int bottomGuide = 1556; // Y-Coord of Bottom, small scale is 312, large is 1556
int guideWidth = rightGuide - leftGuide, toDrawX = 0, toDrawY = 0, i = 0;
String[] allFiles;
boolean isDone = false, finalImage = false, zoom = false, needToLoad = true;

/* workingOn is the one we're resizing, temp is used when zooming */
PImage workingOn, temp; 
PGraphics alphaG;

java.io.FilenameFilter jpgFilter = new java.io.FilenameFilter() {
  boolean accept(File dir, String name) { return name.toLowerCase().endsWith(".jpg"); }
};

void setup() { 
   size(6016, 4000);
   frameRate(45);
   allFiles = listFileNames(sketchPath() + "/Data/");
   printArray(allFiles);
   
   /* Transparent Background PGraphic */
   /* Dimensions of the FAD pictures are (6016, 4000) */
   alphaG = createGraphics(6016, 4000, JAVA2D); 
   background(0);
}

void draw() {
  if (needToLoad && i < allFiles.length) { // If a new image needs to be loaded
    workingOn = loadImage(allFiles[i]);
    workingOn.resize(1200, 800);
    needToLoad = false;
  }
  if (i == allFiles.length) { finalImage = true; }
  if (!isDone && !finalImage) {
    image(workingOn, toDrawX, toDrawY);
    if (zoom) {  //Displays a zoomed in display of where the mouse is
      stroke(255, 125);
      temp = workingOn.get(mouseX - 20, mouseY - 20, 40, 40);
      temp.resize((int)(temp.width * 3), (int)(temp.height * 3));
      image(temp, mouseX, mouseY + 15);
      if (clicks == 2) { line(mouseX + 30, mouseY + 75, mouseX + 90, mouseY + 75);  }
      else { line(mouseX + 60, mouseY + 45, mouseX + 60, mouseY + 105); }
    }
  
    stroke(188, 92, 94);
    if (clicks >= 1) { line(leftX , 0, leftX , 800); }
    if (clicks == 2) { line(rightX, 0, rightX, 800); }
  }
  else if (!finalImage) {
    background(0);
    
    /* Need to use PGraphics so we can have a transparent PNG */
    alphaG.beginDraw();
      alphaG.clear();  // Delete any old images from the display
      alphaG.image(workingOn, toDrawX, toDrawY);
    alphaG.endDraw();
    alphaG.save("P" + allFiles[i].substring(0, 4) + ".png");
    
    println ("Saved \"" + allFiles[i] + ".png\""); 
    isDone = false;
    needToLoad = true;
    i++;
    toDrawX = 0;
    toDrawY = 0;
  }
  else { exit(); }
}

/* [z] toggles a zoom-in on the image | [u] undoes the last click, decrements clicks */
void keyPressed() {
  if      (key == 'z' && !zoom) { zoom = true; }
  else if (key == 'z' &&  zoom) { zoom = false; }
  else if (key == 'u')          { clicks--; }
}

/* Sets the values of leftX on the first click, rightX on the second click, */
/* and bottomY on the third click. Upon the third click, resize() is called */
void mouseClicked() {
  if      (clicks == 0) { leftX   = mouseX; clicks++; }
  else if (clicks == 1) { rightX  = mouseX; clicks++; }
  else if (clicks == 2) { bottomY = mouseY; clicks=0; resize(); isDone = true; }
}

/* This function changes the image dimensions of workingOn, */
/* also scales leftX, rightX, bottomY, toDrawX, toDrawY */
void resize() {
   int inputDX = rightX - leftX;
   float scale = (float) guideWidth / (float) inputDX;
   workingOn.resize((int)(workingOn.width*scale), (int)(workingOn.height*scale));
   leftX   *= scale; 
   rightX  *= scale;
   bottomY *= scale;
   toDrawX  = rightGuide - rightX;
   toDrawY  = bottomGuide - bottomY;
}

/* Fills a String array with a list of all files in /dir/ */
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list(jpgFilter);
    return names;
  } else { return null; }
}
