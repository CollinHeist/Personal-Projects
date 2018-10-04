/* Maze Creator main file */
/* Made by Collin Heist */
/* Last updated 12.23.17 */

/* The input file to this (data.txt) is formatted like:
		width height numInputs
		item1 weight1
		item2 weight2
		etc...
 */

#include <iostream>
#include <fstream>
#include <time.h>
#include <random>

using namespace std;

int main() {
	ifstream reader; /* The ifstream we'll use to read our text file data.txt */
	reader.open("data.txt");
	int width = 0, height = 0, numInputs = 0;
	char ** grid; /* The actual grid that is outputted to the console */
	char * inputs; /* What characters can be used in the maze */
	float * weights; /* Individual weights for the characters */
	
	if (reader.is_open()) {
		string line = "";
		string delim = " "; /* What the starting dimensions are separated by */

		/* Format for data.txt goes "width height numInputs" */
		getline(reader, line); /* Fills line with the first line in the file */
		width = atoi(line.substr(0, line.find(delim)).c_str()); /* Convert the first section of text to width */
		line.erase(0, line.find(delim) + delim.length());
		height = atoi(line.c_str()); /* Convert the first section of text to height */
		line.erase(0, line.find(delim) + delim.length());
		numInputs = atoi(line.c_str()); /* Grab the number of inputs from the first line */

		grid = new char * [height];
		for (int i = 0; i < height; i++)
			grid[i] = new char[width];

		for (int i = 0; i < height; i++)
			for (int j = 0; j < width; j++) 
				grid[i][j] = '-'; /* Initialize the values of grid to - in case they're not changed */

		inputs = new char[numInputs];
		weights = new float[numInputs];
		
		int rCount = 0;
		while (getline(reader, line) ) {
			inputs[rCount] = line[0]; /* Each first character on the line is the input */
			line.erase(0, line.find(delim) + delim.length());
			weights[rCount] = stof(line); /* Convert the rest of the line to a float for the weights */
			rCount++;
		}
		reader.close();
	}
	else
		cout << "Unable to open file";

	int precision = 10000; /* 10 is as precise as 10%, 100 is as precise as 1%, 1000 is .1%, etc. */

	char pullFrom[precision]; /* An array of 100 elements, with # elements corresponding to the weights of each character */
	int toMake = weights[0] * precision; /* How many of character 'x' to put into pullFrom */
	int onChar = 0; /* Which character we're looking at */
	for (int i = 0; i < precision; i++) {
		if (i == toMake) { toMake = weights[onChar + 1] * precision + i; onChar++; } /* Move to the next character */
		pullFrom[i] = inputs[onChar];
	}

	random_device rd;
	mt19937 dir(rd());
	uniform_real_distribution<double> dist(0.0, 1.0);
	for (int i = 0; i < height; i++) {
		for (int j = 0; j < width; j++) {
			double ran = dist(dir);
			// int randomNum = rand() % precision;
			grid[i][j] = pullFrom[(int)(ran * (double)precision)]; /* Make each spot a random character, grabbed from pullFrom */
		}
	}

	for (int i = 0; i < height; i++) {
		for (int j = 0; j < width; j++) 
			cout << grid[i][j];
		cout << endl;
	}

	/* Clear up the memory allocated by the arrays */
	for (int i = 0; i < height; i++) 
		delete [] grid[i];
	delete grid;
	delete weights;
	delete inputs;
	
	return 1;
}
