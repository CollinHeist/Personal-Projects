/* Main.cpp
 *
 * CS 121.Bolden.........clang-900.0.38...........Collin H. Heist
 * 11/2/2017 ............Macbook Pro & CPU........heis0741@vandals.uidaho.edu
 *
 * Read from a data file containing information about movies, add that information to a BST
 * and, using BST traversal methods, check and output various aspects of the movies, actors and years
 *---------------------------------------------------------------------
 */

#include <iostream>
#include <string>
#include <fstream>
#include "BinaryTree.h"
using namespace std;

int main() {
	BinaryTree bst;

	ifstream reader;
	reader.open("data.txt"); /* Assume our data file is called data.txt */

	if (reader.is_open()) {
		/* Possible valid characters that signify the line is a non 'blank' without checking for various spacing patterns */
		string validChars = 
			"abcdefghijklmnopqrstuvwxyzABCDEFGIHJKLMNOPQRSTUVWXYZ1234567890`~!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?']";
		string line = ""; /* Temporary strings for the line, title and actors */
		string title = "";
		string actors = "";
		int year = -1;

		bool readTitle = false; /* Keeps track of whether or not the title line has been read */

		while (getline(reader, line)) { /* Read the text file line-by-line */
			if (line.find_first_of(validChars) != string::npos) { /* If the line contains a valid character it is non-blank */
				line.erase(remove(line.begin(), line.end(), '\t')); /* Remove any tabs from the line */
				if (!readTitle) {
					title = line.substr(0, line.find("(")-1); /* The title is segment of the line up until "(" */
					line.erase(0, line.find("(") + 1); /* Erase the already read segment of line */
					year = atoi(line.substr(0, line.find(")")).c_str()); 
					readTitle = true;
				}
				else {
					actors += line; /* Add the new actor onto the actors string */
					actors += ", "; /* Separate the actors values with commas */
				}
			}
			else { /* A blank line give that it contains no letters, numbers, or characters */
				/* If the actors field is non-empty | Remove the comma and space at the end of the line */
				if (actors.size() > 2) actors = actors.substr(0, actors.size()-2);
				if (title != "") bst.addNode(title, actors, year); /* Add the populated fields as a node to the tree */
				actors = ""; /* Reset the actors field | Needs to be done since it is contatenated each line */
				readTitle = false; 
			}
		}

		reader.close();
	}
	else
		cout << "data.txt Could Not Be Opened..";

	cout << endl;

	bst.listActors("Blade Runner"); cout << endl;
	bst.listActors("The Bourne Ultimatum"); cout << endl;
	bst.listActors("Logan's Run"); cout << endl;
	bst.listActors("Papillon"); cout << endl;
	bst.listActors("The Great Escape"); cout << endl;

	bst.findActor("Matt Damon"); cout << endl;
	bst.findActor("Carrie Fisher"); cout << endl;
	bst.findActor("Steve McQueen"); cout << endl;
	bst.findActor("Mark Hamill"); cout << endl;
	bst.findActor("Clint Eastwood"); cout << endl;

	bst.findYear(1977); cout << endl;
	bst.findYear(2007); cout << endl;

	return 1;
}
