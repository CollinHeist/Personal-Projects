# Personal-Projects
A repository where I'll post all of my random, personal projects

### MusicCleaner  
  * Really simple program to clean up a Mac's iTunes music directory of unnecessary pictures and `.DS_Store` files
  * Physically deletes files in the provided directory, so run at one's own risk. Although it __shouldn't__ delete anything but a `.DS_Store`, `.png`, or `.jpg` files which it does automatically (also deletes duplicate songs but that's the point..)
### MediaAnalysis
  * A Processing-based visualization program that displays `.csv` formatted duration data as one continuous day.
  * Personally used for showing when, throughout the day, I watch TV. Can also be used for other kinds of duration data, but it needs to be equivalently formatted.
  * Written in Java, but utilizes some of Processing's drawing functionality. The output visualization is to be read bottom -> top, left -> right. 
### ImageCentering
  * This might not be very useful for most people, but it _basically_ allows for selecting three points to center a series of images about.
  * As of now, this aligns wherever the user's first three clicks are to `leftGuide`, `rightGuide`, and `bottomGuide`. In that order.
  * This creates a resized 6016 x 4014 `.png` image where the current image is resized to align with the above guides, and the rest of the image is transparent (will look white on most image-viewers).
  * Kind of hard to visualize or explain, if it sounds like something that might be useful, try it with a test image to see how it works and perhaps tweak it for your liking.
