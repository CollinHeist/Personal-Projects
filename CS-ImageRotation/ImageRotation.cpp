/* Image Rotation implementation file */
/* Made by Collin Heist */
/* Last Modified 08.31.17 */

#include <iostream>
#include <fstream>
#include <string>

using namespace std;

void rotateRight (short** image, int numRow, int numCol);
void rotateLeft (short** image, int numRow, int numCol);
void printArray (short** image, int numRow, int numCol);

int main() {
	int numRow, numCol; // numRow is the first digit, numCol is the second
	
	ifstream fReader;
	fReader.open("data.txt");
	if (fReader.is_open()) {
		short** image;
		string line;
		string delim = " "; // What each numer is separated by
    
    /* Read the first line of the text file, grab the row and column values */
		getline(fReader, line);
		numRow = atoi(line.substr(0, line.find(delim)).c_str());
		line.erase(0, line.find(delim) + delim.length());
		numCol = atoi(line.substr(0, line.find(delim)).c_str());
		cout << "Size: " << numRow << " x " << numCol << endl;
		
    /* Allocate the two dimensional array */
		image = new short* [numRow];
		for (int i = 0; i < numRow; i++)
			image[i] = new short(numCol);

    /* Initialize the two dimensional array's values to -1 */
		for (int i = 0; i < numRow; i++)
			for (int j = 0; j < numCol; j++) 
				image[i][j] = -1;
				
    /* Read the text file line-by-line and fill in the image array */
		string token;
		for (int i = 0; i < numRow; i++) {
			getline(fReader, line); // Read the next line each loop
			for (int j = 0; j < numCol; j++) {
				token = line.substr(0, line.find(delim)); //Make token our next number to read
				line.erase(0, line.find(delim) + delim.length()); //Delete the just-read part of line
				image[i][j] = short(atoi(token.c_str())); //Turn the string into an int
			}
		}

		fReader.close();

		/* Print our array,*/
		cout << "Regular Array:";
		printArray(image, numRow, numCol);

		cout << "\n\nLeft Rotated Image:";
		rotateLeft(image, numRow, numCol);
		printArray(image, numRow, numCol);

		cout << "\n\nRight Rotated Image:";
		rotateRight(image, numRow, numCol);
		rotateRight(image, numRow, numCol);
		printArray(image, numRow, numCol);

		/* Deallocate memory to avoid goofing */
		for (int i = 0; i < numRow; i++)
			delete [] image[i];
		delete [] image;
	}

	return 1;
}

/* Print the passed 2D array */
void printArray (short** image, int numRow, int numCol) {
	for (int i = 0; i < numRow; i++) {
		cout << endl;
		for (int j = 0; j < numCol; j++) 
			cout << image[i][j] << " "; 
	}
	cout << endl;
}

/* Rotate the passed 2D array right */
void rotateRight (short** image, int numRow, int numCol) {
	/* Allocate the memory */
	short** tempImage;
	tempImage = new short* [numRow];
	for (int i = 0; i < numRow; i++)
			tempImage[i] = new short(numCol);

	/* Declare the initial values in this array to be -1 */
	for (int i = 0; i < numRow; i++) {
		for (int j = 0; j < numCol; j++) 
			tempImage[i][j] = short(-1);
	}

	/* Moves the correct values from image to tempImage*/
	for (int i = 0; i < numRow; i++) {
		for (int j = 0; j < numCol; j++) {
			tempImage[i][j] = image[numRow-j-1][i];
		}
	}

	/* Finally, override the original array such that, upon exit, it is altered */
	for (int i = 0; i < numRow; i++) {
		for (int j = 0; j < numCol; j++) {
			image[i][j] = tempImage[i][j];
		}
	}

	/* Deallocate memory to avoid goofing */
	for (int i = 0; i < numRow; i++)
		delete [] tempImage[i];
	delete [] tempImage;
}

/* Rotate the passed 2D array left | Calls rotateRight three times */
void rotateLeft (short** image, int numRow, int numCol) {
	/* One left turn is equal to three right turns */
	for (int i = 0; i < 3; i++)
		rotateRight(image, numRow, numCol);
}
