# Personal-Projects
## CityMaker (Processing / Java)
 * Random (procedural) CityMaker Processing sketch to generate nice-looking city blocks (found online, do not know who to credit).
 * Hard to describe, but it makes some pretty pictures - an example of which is shown below:

<img src="./Reference Images/CityMaker.png">

## DataScience2020 (Python / Jupyter Notebook)
 * My working notebook for the University of Idaho Data Science 2020 competition.
 * The goal is to create a neural network that scores a testing set of 20,000 handwritten calculus integrals
 * I am currently using the `DenseNet` from `Keras` for my model; however I will be making changes until the competition is over.

## Duplicate Picture Identifier (Python / Jupyter Notebook)
 *  `Duplicate Picture Identifier.ipynb` is a program that allows the selection of a directory, and all images within that directory will be compared using their average image hash.
 * Duplicates are identified and a subfolder `/Duplicates/` is created with numerized folders containing aliases to each duplicate of the source file.
 * Currently transitioning the program to an object-oriented approach that utilizes a `FileSorter` class as opposed to individual function calls.
 * The `FileSorter` object has the ability to detect names (think usernames from Reddit / Instagram or trip names) from either filenames or embedded text within the image using `pytesseract` for OCR. These sorted files can be mapped to destination directories during the sorting process.
 * `File Tracker.ipynb` is a supplemental program that tracks how many files are within each subfolder of a given directory.
 * File Tracker notebook is useful in keeping a real-time count of how my file sorting is going.
 
## FaceCenter (Java / Processing)
 * This might not be very useful for most people, but it _basically_ allows for selecting three points to center a series of images about.
 * As of now, this aligns wherever the user's first three clicks are to `leftGuide`, `rightGuide`, and `bottomGuide`. In that order.
 * This creates a resized 6016 x 4014 `.png` image where the current image is resized to align with the above guides, and the rest of the image is transparent (will look white on most image-viewers).
 * Kind of hard to visualize or explain, if it sounds like something that might be useful, try it with a test image to see how it works and perhaps tweak it for your liking.
	
## Finance Manager (Python)
 * Python program to keep XML-based histories of receipts.
 * `/XML Files/` contains `.xml` files for each product code that exists in the program. `dates.xml` contains a complete list of previously scanned items.
 * `/Visualization/` is the NetBeans visualization that I am currently working on to visualize purchases.
 * `/Text Files/` is the input folder for OCR'd receipts that will be read by the Python script.
 * `/Scanned Text Files/` is the folder where already-scanned receipts are placed.
 * `/Receipts/` is the folder for receipt images are placed for safe-keeping.
 * This program utilizes the `xml` package within Python. 
 
    
## MNIST-Data-Science (Python / Jupyter Notebook)
 * Code I utilized for my University of Idaho Data Science Competition back for my Freshman year. 
 * Implements a convolutional neural network to parse simple handwritten arithmetic based on a training set provided by the school.
 * Deep learning was done using `Keras`
 * Image augmentation is utilized to create more _messy_ data for improving the accuracy of the model.
 * I placed 3rd in the competition with this model, achieving ~99% accuracy.

## MediaAnalysis (Java / Processing)
  * A Processing-based visualization program that displays `.csv` formatted duration data as time-plotted durations.
  * Personally used for showing when I watch TV. Can also be used for other kinds of duration data, but it needs to be equivalently formatted.
  * Written in Java, but utilizes some of Processing's drawing functionality. The output visualization is to be read bottom -> top, left -> right.
  * An example of the type of output of this program is shown below, where I've plotted my TV-watching and highlighted all instances where I watched "The Office". 

<img src="./Reference Images/MediaAnalysis.png" width="800">
	
## MusicCleaner  
  * Really simple program to clean up a Mac's iTunes music directory of unnecessary pictures and `.DS_Store` files
  * Physically deletes files in the provided directory, so run at one's own risk. Although it __shouldn't__ delete anything but a `.DS_Store`, `.png`, or `.jpg` files which it does automatically (also deletes duplicate songs but that's the point..)

## MusicViz
  * __Super__ basic music vizualization program that live visualizes a song's relative loudness in an circle as a series of lines projecting outward.
  * This utilizes the minim music class, although that was primarily because I couldn't find any other way to analyze music.
  * There is a lot of changes that need to be made here, but if you'd like to see how it works, put `.mp3` songs in the Processing `/data/` folder. Then specify the song inside the program.
  * I'd like to fix the line-drawing code, and basically refactor everything, but for now it _works_...

## PaperSketch (Processing / Java)
 * To be detailed later.
	
## Statistical Formatting (Python / Juypter Notebook)
 * Jupyter notebook that reads the `/Screenshots/` subfolder for iOS screenshots of a timer.
 * The durations are read, stored in a `Pandas` `DataFrame` and then exported to the `data.csv` file for exporting to Google Sheets.
 * The SSIM algorithm is utilized to detect the numbers 0-9 on each subdivision of the duration screenshot, these reference images are stored in `/Reference Images/`
 
## University of Idaho
 * To be detailed later.