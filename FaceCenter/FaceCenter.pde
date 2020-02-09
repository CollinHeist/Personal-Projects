// Duration Visualization Program
// Made by Collin Heist
// Last Modified 05.08.18

/* -------------------------- Global variable declarations --------------------------- */

int leftX = 0, rightX = 0, bottomY = 0, clicks = 0;
final int leftGuide = 3039;   // X-coord of Left, small scale is 604, large is 3039
final int rightGuide = 3217;  // X-coord of Right, small scale is 643, large is 3217
final int bottomGuide = 1556; // Y-Coord of Bottom, small scale is 312, large is 1556
int guideWidth = rightGuide - leftGuide, toDrawX = 0, toDrawY = 0, i = 0;
String[] allFiles ;
boolean isDone = false, finalImage = false, zoom = false, needToLoad = true;

/* --------- workingOn is the PImage we're resizing, temp is used for zooming -------- */
PImage workingOn, temp; 
PGraphics alphaG;

/* -------------- A file filter that returns true if the file is a .jpg -------------- */

java.io.FilenameFilter jpgFilter = new java.io.FilenameFilter() {
  boolean accept(File dir, String name) { return name.toLowerCase().endsWith(".jpg"); }
};

/* -------- setup function that fills allFiles[] with all the files in /Data/ -------- */
/* -------- Also establishes a background transparent object sized 6016 x 4000 ------- */

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

/* --------------------- Draw loop that runs all real-time code ---------------------- */

void draw() {
  /* --------- Load the next image into memory, one-at-a-time to run smoothly -------- */
  if (needToLoad && i < allFiles.length) { // If a new image needs to be loaded
    workingOn = loadImage(allFiles[i]);
    //workingOn.resize(1200, 800);
    workingOn.resize(6016, 4000);
    needToLoad = false;
  }

  /* ----------------------- If we're not yet on the last image ---------------------- */
  if (i == allFiles.length) { finalImage = true; }
  if (!isDone && !finalImage) {
    image(workingOn, toDrawX, toDrawY); /* ------ Draw the image we're resizing ------ */
    if (zoom) { /* ------ Draw a zoomed in version of the area around the mouse ------ */
      stroke(255, 125);
      temp = workingOn.get(mouseX - 20, mouseY - 20, 40, 40);
      temp.resize((int)(temp.width * 3), (int)(temp.height * 3));
      image(temp, mouseX, mouseY + 15);
      /* ---- Draw the vertical / horizontal lines inside of the zoomed-in image ----- */
      if (clicks == 2) { line(mouseX + 30, mouseY + 75, mouseX + 90, mouseY + 75);  }
      else { line(mouseX + 60, mouseY + 45, mouseX + 60, mouseY + 105); }
    }
  
    /* ----- Draw the vertical / horizontal guide lines inside of the main image ----- */
    stroke(188, 92, 94);
    if (clicks >= 1) { line(leftX , 0, leftX , 800); }
    if (clicks == 2) { line(rightX, 0, rightX, 800); }
  }
  else if (!finalImage) {
    background(0);
    
    /* --- We use PGraphics to have a transparent PNG, also reduces lag of loading --- */
    /* ----------- more than one image at a time, if we're realigning a lot ---------- */
    alphaG.beginDraw();
      alphaG.clear(); /* -------- This deletes any old images from the display ------- */
      alphaG.image(workingOn, toDrawX, toDrawY);
    alphaG.endDraw();
    alphaG.save("P" + allFiles[i].substring(0, 4) + ".png");
    
    println ("Saved \"" + allFiles[i] + ".png\"");

    /* Reset - load next image, increment count, and draw the image at the top corner  */
    isDone = false;
    needToLoad = true;
    i++;
    toDrawX = 0;
    toDrawY = 0;
  }
  else { exit(); }
}

/* ----- Toggleable keys | [z] - Toggles a zoom-in on the image around the mouse ----- */
/* ----------- [u] - Undo the last click by decrementing the click counter ----------- */

void keyPressed() {
  if      (key == 'z' && !zoom) { zoom = true; }
  else if (key == 'z' &&  zoom) { zoom = false; }
  else if (key == 'u')          { clicks--; }
}

/* ---- Sets the values of leftX on the first click, rightX on the second click, ---- */
/* ---- and bottomY on the third click. Upon the third click, resize() is called ---- */

void mouseClicked() {
  if      (clicks == 0) { leftX   = mouseX; clicks++; }
  else if (clicks == 1) { rightX  = mouseX; clicks++; }
  else if (clicks == 2) { bottomY = mouseY; clicks=0; resize(); isDone = true; }
}

/* ---- This function changes the image dimensions of workingOn, and appropriately --- */
/* --------------- scales leftX, rightX, bottomY, toDrawX, and toDrawY --------------- */

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

/* --------- Fills a String array with a list of all the .jpg files in /dir/ --------- */

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list(jpgFilter);
    return names;
  } else { return null; }
}