/* -------------------------- Global variable declarations --------------------------- */

StringList dates, titles;
float[]  lineVals;
FloatList startTime, endTime, completeCoords;
boolean[] isNewDate, isEmptyDate;
float tempYVal, xLoc, dateWidth;
int rowCount, numEmpty = 0, numDates = 0, bezel = 1;
int oldDimensions[] = {1, 1}; // Stored like [w,h]
boolean showHours = false, showNames = false, showEmptyDates = false, isMedia = true;
String tempTitle;
String times[] = {"23:00", "0:00", "1:00", "2:00", "3:00", "4:00", "5:00", 
                  "6:00", "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", 
                  "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00",
                  "20:00", "21:00", "22:00", "23:00", "24:00", "1:00"};
                  
/* -------- These are the adjustable variables, the ones we change at runtime -------- */
                  
String inputTitle = "The Office";
//String csvTitle = "Non-Media Data.csv"; // Non media CSV for testing
String csvTitle = "Media.csv"; // Media CSV for testing

/* -- The setup function, it initializes the correct lists from the data in csvTitle - */

void setup() {
  size(1200, 725);
  //fullScreen();
  frameRate(60);
  Table data = loadTable(csvTitle);
  rowCount = data.getRowCount();
  if (data.getColumnCount() < 4) { isMedia = false; }
  surface.setResizable(true);
  
  /* ----------------------- Initialize the size of our arrays ----------------------- */
  dates = new StringList();
  if (isMedia) { titles = new StringList(); }
  startTime      = new FloatList();
  endTime        = new FloatList();
  lineVals       = new float[27];
  isNewDate      = new boolean[rowCount];
  isEmptyDate    = new boolean[rowCount];
  completeCoords = new FloatList(); /* ---- This is the coordinate list to draw at --- */
  
  /* ------------ Fills each respestive array with the corresponding data ------------ */
  for (int counter = 0; counter < rowCount; counter++ ) {
    /* --------------------------------- dates data ---------------------------------- */
    dates.set(counter, data.getString(counter, 0));
    if (dates.get(counter) != null && dates.get(counter).trim().length() != 0) {
      numDates++;
      isNewDate[counter] = true;
    }
    
    /* -------------------------------- startTime data ------------------------------- */
    startTime.set(counter, data.getFloat(counter, 1));
    if (!(startTime.get(counter) > -1)) { /* A NaN value in startTime is an empty date */
      numEmpty++;
      isEmptyDate[counter] = true;
    }
    
    /* -------------------------------- endTime data --------------------------------- */
    endTime.set(counter, data.getFloat(counter, 2));


    /* -------------- If we're looking at a media sheet, grab the title -------------- */
    if (isMedia) { titles.set(counter, data.getString(counter, 3)); }
  }
  
  /* -------- Take a look at our topN (currently set to 10) most watched shows ------- */
  if (isMedia) {
    StringList analyzed = new StringList();
    analyzed = showDurations();
    StringList topN = analyzeShows(analyzed, 10);
    print(topN);
  }
}

/* ------------------- The draw() loop, it updates the coordinates ------------------- */
/* ---- of the visualization as per the screen size. Also runs textHours (if true) --- */

void draw() {
  background(213);
  strokeWeight(.4);
  translate(0, height); /* Shift the coordinates to act like quadrant 1 of an x-y grid */
  
  /* ----- Allows for screen resizing by changing values of the completeCoords[] ----- */
  dateWidth = width / (float) numDates;
  float pixelsPerHour = (height - 50) / 26.0; /* - Divide by 26 to account for 1 AM -- */
  updateCoords(oldDimensions, dateWidth);
  
  showHourLines(pixelsPerHour);
  
  /* ---------------- Draw the corresponding data from completeCoords ---------------- */
  /* --- calls either mediaDrawing() or regDrawing() if it's media we're looking at -- */
  if (isMedia)   { mediaDrawing();  }
  else           { regDrawing();    }
  if (showHours) { showTextHours(); }
}

/* -------------------------------- Toggleable values -------------------------------- */
/* ----------------- [w/s] adjust the bezels on the drawn rectangles ----------------- */
/* --- [h] toggles the hours on visualizations (appear when mouse hovers near line) -- */
/* ------------ [n] toggles the highlighting of the specified inputTitle ------------- */
/* ---- [e] turns on red highligh bars on days with no TV | [p] saves a screenshot --- */

void keyPressed() {
  if      (key == 'w')               { bezel++; println("bezel: ", bezel); }
  else if (key == 's')               { bezel--; println("bezel: ", bezel); }
  else if (key == 'h' && !showHours) { showHours = true;  println("showHours: ", showHours); }
  else if (key == 'h' &&  showHours) { showHours = false; println("showHours: ", showHours); }
  else if (key == 'n' && !showNames) { showNames = true;  println("showNames: ", showNames); }
  else if (key == 'n' &&  showNames) { showNames = false; println("showNames: ", showNames); }
  else if (key == 'e' && !showEmptyDates) { showEmptyDates = true;  println("showEmptyDates: ", showEmptyDates); }
  else if (key == 'e' &&  showEmptyDates) { showEmptyDates = false; println("showEmptyDates: ", showEmptyDates); }
  else if (key == 'p')                    { saveFrame("###.png"); }
}

/* -- Function that puts text near the mouse when it is hovered near the hour lines -- */

void showTextHours() {
  fill(28);
  for (int hour = 0; hour < 27; hour++) {
    if (mouseY > abs(lineVals[hour]) - 10 && mouseY < abs(lineVals[hour]) + 10) {
      textSize(24);
      text(times[26-hour], map(mouseX, 0.0, width, 0.0, 1200.0), -7-height-map(mouseY, 0.0, height, 0.0, -725.0));
    }
  }
}

/* ---- Draw lines for delineating hours | 1:00, 13:00, and 25:00 are darker lines --- */

void showHourLines(float pixelsPerHour) {
  textSize(7.5);
  for (float hour = 0; hour < 27; hour++) {
    fill(27, 27, 27);
    if (hour != 1 && hour != 13 && hour != 25) {
      strokeWeight(.2);
      line(0, -(25.0 + (pixelsPerHour * hour)), width, -(25.0 + (pixelsPerHour * hour)));
    } else {
      strokeWeight(1.2);
      line(0, -(25.0 + (pixelsPerHour * hour)), width, -(25.0 + (pixelsPerHour * hour)));
    }
    lineVals[(int)hour] = -(25.0 + (pixelsPerHour * hour));
    fill(0);
    text(times[(int)hour], 5, -(18.0 + (pixelsPerHour * hour)));
  }
}

/* ------ Drawing function for Media input data - Difference from regDrawing is ------ */
/* ---------- the toggle-able ability to turn highlight the matching titles ---------- */

void mediaDrawing() {
  for (int counter = 0, realCount = 0; counter < (rowCount * 4); counter += 4, realCount++) {
    fill(53, 138, 240, 212);
    if (showNames && isMedia) {  // If the showNames toggle is on, and it's a media set
      tempTitle = titles.get(realCount).toLowerCase();
      textSize(30);
      text(inputTitle, 25, -105);
      if (!inputTitle.toLowerCase().equals(tempTitle)) { // Check if the current title matches
        fill(255, 255, 255, 212);
      }
    }

    if (!isEmptyDate[realCount]) {  //A non-empty date, draw corresponding media
      rect(completeCoords.get(counter), completeCoords.get(counter+1), completeCoords.get(counter+2), completeCoords.get(counter+3), bezel);
    }
    else if (showEmptyDates) {  //An empty date, draw an indication (or nothing)
      fill(216, 59, 59, 45);
      rect(completeCoords.get(counter), completeCoords.get(counter+1), completeCoords.get(counter+2), completeCoords.get(counter+3), bezel);
    }
  }
}

/* -------------------- Drawing function for non-Media input data -------------------- */

void regDrawing() {
  for (int counter = 0, realCount = 0; counter < (rowCount * 4); counter += 4, realCount++) {
    fill(53, 138, 240, 212);
    if (!isEmptyDate[realCount]) {  //A non-empty date, draw corresponding media
      rect(completeCoords.get(counter), completeCoords.get(counter+1), completeCoords.get(counter+2), completeCoords.get(counter+3), bezel);
    }
    else if (showEmptyDates) {  //An empty date, draw an indication (or nothing)
      fill(216, 59, 59, 45);
      rect(completeCoords.get(counter), completeCoords.get(counter+1), completeCoords.get(counter+2), completeCoords.get(counter+3), bezel);
    }
  }
}

/* --- Based off of the old values of the height and width, update completeCoords[] -- */

void updateCoords(int[] oldDimensions, float dateWidth) {
  if (oldDimensions[1] != height || oldDimensions[0] != width) { // Only update these coordinates if the window changed
    completeCoords.clear(); // Erase the old completeCoords array, start over with .append
    oldDimensions[1] = height; oldDimensions[0] = width; // Update the 'old' values
    
    /* ----- Loop through each row and fill corresponding arrays with their data ----- */
    xLoc = -dateWidth;
    for (int counter = 0; counter < rowCount; counter++) {
      if (isNewDate[counter]) { xLoc += dateWidth; } /* New date, move the xLoc forward */
      if (!isEmptyDate[counter]) {    /* Date contains media values, is not empty */
        completeCoords.append(xLoc);  /* xLocation - how far down x-axis to start */
        tempYVal = -((abs(startTime.get(counter))*(height-50))+25);
        completeCoords.append(tempYVal);
        completeCoords.append(dateWidth);
        tempYVal = -((abs(endTime.get(counter))-abs(startTime.get(counter)))*(height-50));
        completeCoords.append(tempYVal);
      } 
      else { /* Date does not contain media values, add 'blank' filler data */
        completeCoords.append(xLoc);
        completeCoords.append(0);
        completeCoords.append(dateWidth);
        completeCoords.append(-height);
      }
    }
    println("New Height: " + height + ", New Width: " + width);
  }
}

/* ---------- Fills a StringList with [n:Title][n+1:DurationSum][n+2:Count] ---------- */

StringList showDurations() {
  StringList showSums = new StringList();
  for (int i = 0; i < rowCount; i++) {
    /* ----------- If the title of the current entry is already in the list ---------- */
    if (showSums.hasValue(titles.get(i)) == true) {
      for (int j = 0; j < showSums.size(); j+=3) {
        if (showSums.get(j).equals(titles.get(i))) { // 'j' is the location of that title
          float tempDuration = endTime.get(i) - startTime.get(i);
          // If the entry is NaN, then update it with the new duration | Shouldn't happen, but error handling
          if (showSums.get(j+1).equals("NaN")) { showSums.set(j+1, str(tempDuration)); }
          else { showSums.set(j+1, str(float(showSums.get(j+1)) + tempDuration)); }
          showSums.set(j+2, str(int(showSums.get(j+2)) + 1));
          j = showSums.size(); // Skip to the end of the loop, minimizes looping
        }
      }
    }
    /* -- The current entry's title is not in the list, and is shorter than 70 min. -- */
    else if (!isEmptyDate[i] && endTime.get(i) - startTime.get(i) <= 70.0 / (24.0 * 60.0)) {
      showSums.append(titles.get(i));
      showSums.append(str(endTime.get(i) - startTime.get(i)));
      showSums.append(str(1)); // First entry, append a 1 to the count spot 
    }
  }

  return showSums;
}

/* --- Returns a StringList with the topN shows sorted by how long each was watched -- */
/* --- The returned is structured as [n:Title][n+1:DurationSum][n+2:PercentTotalTV] -- */

StringList analyzeShows(StringList durations, int topN) {
  StringList analysis = new StringList();
  StringList temp = durations;
  float decimalSum = 0;
  
  /* --------------- Remove all the non-decimal values from durations[] -------------- */
  /* ---------- Also assigns decimalSum to be the total amount of TV watched --------- */
  int countUntil = temp.size();
  for (int i = 0; i < countUntil; i++) {
    if(floor(float(durations.get(i))) == float(durations.get(i))) { // If the value is a whole integer (the count spot)
      if (!Float.isNaN(float(durations.get(i-1)))) { // Ignore all NaN values in the decimal spot | Error handling
        decimalSum += float(durations.get(i-1)); // The previous entry is the decimal duration | Add to sum
      }
      durations.remove(i);
      i--; countUntil--; // Since we just removed an index of durations, we need to re-evaluate that spot
    }
  }
  
  /* ------ Fill the analysis array with the sorted topN entries from durations ------ */
  for (int tt = 0; tt < topN; tt++) {
    int maxIndex = 0; // Index of the ENTRY that is the max value, not its position in duration
    for (int i = 0; i < temp.size() / 2; i += 2) { // Each entry has two spots in durations
      if (!Float.isNaN(float(temp.get(i+1))) && (float(temp.get(i+1)) > float(temp.get(maxIndex+1)))) {
        maxIndex = i;
      }
    }
    analysis.append(temp.get(maxIndex)); // Add the TV name to the list
    analysis.append(temp.get(maxIndex+1)); // Add the duration sum to the list
    analysis.append(str(100.0 * float(temp.get(maxIndex+1)) / decimalSum) + "%"); // Add it's percentage
    temp.remove(maxIndex+1); temp.remove(maxIndex); // Remove the 2nd element first, no index problems
  }
  
  return analysis;
}
