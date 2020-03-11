/* Main File */
/* Collin Heist */
/* CS 121 */

#include <iostream>
#include <fstream>
#include <string>
#include "Queue.h"

using namespace std;

/* A structure used to track x and y coordinates in the maze | Decreases # of parameters passed to functions */
struct cell {
	cell (int x = -1, int y = -1) { /* Initialize x and y values to -1 for debugging */
		xPos = x;
		yPos = y;
	}
	int xPos;
	int yPos;
};

void mazeSolver(string ** maze, int width, int height);
bool checkExit(int width, cell current, cell exit);
void checkNeighbors(bool ** visited, bool ** inQueue, int width, int height, cell current, Queue & xVal, Queue & yVal);
void printMaze(string ** maze, int width, int height);

int main() {
	ifstream reader; /* The ifstream we'll use to read our text file data.txt */
	reader.open("data.txt");
	int width = 0, height = 0;
	string ** maze; /* The maze that will be populated with values from the text file */
	/* Using string ** instead of char ** because we run into null character problems with chars */

	if (reader.is_open()) {
		string line = "";
		string delim = " "; /* What the starting dimensions are separated by */

		/* Read the first line in the file and read width and height from there */
		getline(reader, line); /* Fills line with the first line in the file */
		width = atoi(line.substr(0, line.find(delim)).c_str()); /* Convert the first section of text to int */
		line.erase(0, line.find(delim) + delim.length()); /* Erase the portion of line that was read */
		height = atoi(line.c_str()); /* Convert the second section of text to int */

		/* Allocate the maze array */
		maze = new string * [height];
		for (int i = 0; i < height; i++)
			maze[i] = new string[width];

		/* Initialize the values in maze[][] to "." */
		for (int i = 0; i < height; i++)
			for (int j = 0; j < width; j++) 
				maze[i][j] = ".";

		/* Fills maze[][] with the values from the input file */
		int rCount = 0;
		while (getline(reader, line) ) {
			for (int cCount = 0; cCount < width; cCount++)
				maze[rCount][cCount] = line[cCount];
			rCount++;
		}
		reader.close();
	}
	else
		cout << "Unable to open file";

	printMaze(maze, width, height); /* Start / input maze */
	mazeSolver(maze, width, height); /* Function to actually traverse / 'solve' the maze */
	printMaze(maze, width, height); /* End / output maze */

	/* Clear up the memory allocated by the maze array */
	for (int i = 0; i < height; i++) 
		delete [] maze[i];
	delete maze;
	
	return 1;
}

/* After finding the start / end positions, the program visits the next cell in the queue until a surrounding cell is the exit */
void mazeSolver(string ** maze, int width, int height) {
	Queue xVal; /* A Queue of the x values for our mazeQ */
	Queue yVal; /* A Queue of the y values for our mazeQ */

	/* start and exit are used to store where the maze begins / ends */
	/* Initialized to be -1 to check if they're omitted from the maze */
	cell start, exit;

	/* Allocate the boolean visited and inQueue array */
	bool ** visited; /* Mirror of maze[][], but tracks already visited cells */
	bool ** inQueue; /* Mirror of maze[][], but tracks cells that are marked to be visited */
	visited = new bool * [height];
	inQueue = new bool * [height];
	for (int i = 0; i < height; i++) {
		visited[i] = new bool[width];
		inQueue[i] = new bool[width];
	}

	/* Initialize the values in visited[][] and inQueue[][] to false */
	for (int i = 0; i < height; i++)
		for (int j = 0; j < width; j++) {
			visited[i][j] = false;
			inQueue[i][j] = false;
		}

	/* Finding the start and exit position within the maze */
	for (int i = 0; i < height; i++) {
		for (int j = 0; j < width; j++) {
			if (maze[i][j] == "S") { /* The start position | Store starting (x, y) in the cell */
				visited[i][j] = true; /* Mark the start position as visited & inQueue, i.e. ignore it*/
				inQueue[i][j] = true;
				start.xPos = j;
				start.yPos = i;
			}
			else if (maze[i][j] == "#") { /* Mark all wall spaces as visited & inQueue , i.e. ignore them */
				visited[i][j] = true;
				inQueue[i][j] = true;
			}
			else if (maze[i][j] == "G") { /* The exit position | Store ending (x, y) in the cell */
				exit.xPos = j;
				exit.yPos = i;
			}
		}
	}

	/* Throws an error if the start or end position are still what they were intiialized to, i.e. never found */
	(start.xPos == -1 || start.yPos == -1 || exit.xPos == -1 || exit.yPos == -1) ? 
		throw exception() : cout << "\nstartX: " << start.xPos << ", startY: " << start.yPos << "\n";

	cell curr(start.xPos, start.yPos); /* Make a cell representing the current cell we're looking at */

	int debug = 0; /* Keep track of how many moves have been made */

	while (!checkExit(width, curr, exit) && debug < width * height) { /* While the exit has not been found in an adjacent cell */
		maze[curr.yPos][curr.xPos] = "o"; /* Mark the current cell with an X, meaning it's been traversed */
		visited[curr.yPos][curr.xPos] = true;  /* Mark the current cell as visited */
		
		checkNeighbors(visited, inQueue, width, height, curr, xVal, yVal); /* Check the surrounding cells for valid neighbors */
		
		/* Move the current position to whatever (x, y) was at the top of the queue */
		curr.xPos = atoi(xVal.removeFromQueue().c_str());
		curr.yPos = atoi(yVal.removeFromQueue().c_str());

		debug++;
	}

	maze[curr.yPos][curr.xPos] = "o";
	maze[start.yPos][start.xPos] = "S";

	/* Output whether or not the maze was solved, and how many moves it took */
	(debug < width * height) ? cout << "\n\n\e[36mSOLVED THE MAZE IN \e[35m" << debug << " \e[36mMOVES\e[0m\n" : cout << "\n\nUnable to solve\n\n";
	cout << "\e[31mWORST CASE: \e[35m" << width * height << " \e[31mMOVES\e[0m\n\n";

	/* Clear up the memory allocated by the visited and inQueue array */
	for (int i = 0; i < height; i++) {
		delete [] visited[i];
		delete [] inQueue[i];
	}
	delete visited;
	delete inQueue;
}

/* Checking at (xLoc, yLoc) for adjacency to the exit at (xLocExit, yLocExit) */
/* Returns true if the exit is one of the adjacent cells */
bool checkExit(int width, cell current, cell exit) {
	int currPos = current.yPos * width + current.xPos; /* What number element the current cell is in the array */
	int exitPos = exit.yPos * width + exit.xPos; /* What number element the exit cell is in the array */
	return (currPos - width == exitPos || currPos - 1 == exitPos || currPos + 1 == exitPos || currPos + width == exitPos) ? true : false;
}

/* Checking at current for unvisited neighbors using visited[][] */
/* If they're unvisited, add them to Queues mazeQ, xVal, and yVal */
/* Adds in the order of South > East > North > West as most mazes end in the bottom right corners */
void checkNeighbors(bool ** visited, bool ** inQueue, int width, int height, cell current, Queue & xVal, Queue & yVal) {
	int currPos = current.yPos * width + current.xPos; /* What number element the current cell is in the array */

	/* Assign the respective array locations to the cardinal directions */
	int north = (currPos - width < 0) ? -1 : currPos - width; /* north = -1 if the northern cell is non-existent */
	int east = ((currPos / width) != ((currPos + 1) / width)) ? -1 : currPos + 1; /* If the east cell is the next row, then east = -1 */
	int south = (currPos + width > width * height - 1) ? -1 : currPos + width; /* If the south cell's # is beyond the # of cells in the maze, south = -1 */
	int west = ((currPos / width) != ((currPos - 1) / width)) ? -1 : currPos - 1; /* If the west cell is the previous row, west = -1 */
	
	/* Need nested ifs, otherwise it will look at possible invalid spots of visited[][] and inQueue[][] if its on an edge */
	/* Need to check that whether it is in the queue already otherwise the same spot can get added / checked multiple times */
	if (south != -1) { /* If the southern neighbor is a valid coordinate */
		if (!visited[(int)(south / width)][south % width] && !inQueue[(int)(south / width)][south % width]) {
			inQueue[(int)(south / width)][south % width] = true;
			xVal.addToQueue(to_string(south % width)); /* Add the x-coord of the southern neighbor to the xVal queue */
			yVal.addToQueue(to_string((int)(south / width))); /* Add the y-coord of the southern neighbor to the yVal queue */
		}
	}
	if (east != -1) { /* If the eastern neighbor is a valid coordinate */
		if (!visited[(int)(east / width)][east % width] && !inQueue[(int)(east / width)][east % width]) {
			inQueue[(int)(east / width)][east % width] = true;
			xVal.addToQueue(to_string(east % width));
			yVal.addToQueue(to_string((int)(east / width))); /* Add the y-coord of the eastern neighbor to the yVal queue */
		}
	}
	if (north != -1) { /* If the northern neighbor is a valid coordinate */
		if (!visited[(int)(north / width)][north % width] && !inQueue[(int)(north / width)][north % width]) {
			inQueue[(int)(north / width)][north % width] = true;
			xVal.addToQueue(to_string(north % width)); /* Add the x-coord of the north neighbor to the xVal queue */
			yVal.addToQueue(to_string((int)(north / width))); /* Add the y-coord of the north neighbor to the yVal queue */
		}
	}
	if (west != -1) { /* If the west neighbor is a valid coordinate */
		if (!visited[(int)(west / width)][west % width] && !inQueue[(int)(west / width)][west % width]) {
			inQueue[(int)(west / width)][west % width] = true;
			xVal.addToQueue(to_string(west % width)); /* Add the x-coord of the western neighbor to the xVal queue */
			yVal.addToQueue(to_string((int)(west / width))); /* Add the y-coord of the western neighbor to the yVal queue */
		}
	}
}

/* Output the maze | Colored such that positions that've been traversed are blue */
void printMaze(string ** maze, int width, int height) {
	for (int i = 0; i < height; i++) {
		cout << endl;
		for (int j = 0; j < width; j++)
			(maze[i][j] == "o") ? cout << "\e[34m\e[1m" << maze[i][j] << " \e[0m" : cout << maze[i][j] << ' '; 
	}
	cout << endl;
}