/* Main.cpp
 *
 * CS 121.Bolden.........clang-900.0.38...........Collin H. Heist
 * 12/6/2017 ............Macbook Pro & CPU........heis0741@vandals.uidaho.edu
 *
 * Reads from 9 data files containg various data sets
 * Compares how selection, quick, and merge sort perform on these data sets
 * The sets are...
 * data100rand.txt , data1000rand.txt , data10000rand.txt
 * data100lth.txt  , data1000lth.txt  , data10000lth.txt
 * data100htl.txt  , data1000htl.txt  , data10000htl.txt
 */

#include <iostream>
#include <fstream>
#include "Sorting.h"
using namespace std;

void compareSortMethods(int input[], int size, string description);

int main() {
	// Allocate arrays for each data file
	int smallArrRand[100];
	int smallArrLtoH[100];
	int smallArrHtoL[100];
	int medArrRand[1000];
	int medArrLtoH[1000];
	int medArrHtoL[1000];
	int largeArrRand[10000];
	int largeArrLtoH[10000];
	int largeArrHtoL[10000]; 

	// Input stream for reading each data file
	ifstream randReader, lowToHighReader, highToLowReader;
	randReader.open("data100rand.txt");
	lowToHighReader.open("data100lth.txt");
	highToLowReader.open("data100htl.txt");
	ifstream medRandReader, medLowToHighReader, medHighToLowReader;
	medRandReader.open("data1000rand.txt");
	medLowToHighReader.open("data1000lth.txt");
	medHighToLowReader.open("data1000htl.txt");
	ifstream largeRandReader, largeLowToHighReader, largeHighToLowReader;
	largeRandReader.open("data10000rand.txt");
	largeLowToHighReader.open("data10000lth.txt");
	largeHighToLowReader.open("data10000htl.txt");

	// True only if every single file was sucessfully opened
	bool isOpen = randReader.is_open() 	 	&& lowToHighReader.is_open()		&& highToLowReader.is_open()    &&
				  medRandReader.is_open()   && medLowToHighReader.is_open()     && medHighToLowReader.is_open() &&
				  largeRandReader.is_open() && largeLowToHighReader.is_open()   && largeHighToLowReader.is_open();
	if (isOpen) {
		string randLine = "", lowToHighLine = "", highToLowLine = ""; // Could use only one string, but this is more readable
		for (int count = 0; count < 10000; count++) { // Maximum 10,000 lines between all the data files
			if (count < 100) { // Only 100 values in the 100 line data files
				getline(randReader, randLine);
				getline(lowToHighReader, lowToHighLine);
				getline(highToLowReader, highToLowLine);
				smallArrRand[count] = atoi(randLine.c_str());
				smallArrLtoH[count] = atoi(lowToHighLine.c_str());
				smallArrHtoL[count] = atoi(highToLowLine.c_str());
			}
			if (count < 1000) { // Only 1000 values in the 1000 line data files
				getline(medRandReader, randLine);
				getline(medLowToHighReader, lowToHighLine);
				getline(medHighToLowReader, highToLowLine);
				medArrRand[count] = atoi(randLine.c_str());
				medArrLtoH[count] = atoi(lowToHighLine.c_str());
				medArrHtoL[count] = atoi(highToLowLine.c_str());
			}
			getline(largeRandReader, randLine);
			getline(largeLowToHighReader, lowToHighLine);
			getline(largeHighToLowReader, highToLowLine);
			largeArrRand[count] = atoi(randLine.c_str());
			largeArrLtoH[count] = atoi(lowToHighLine.c_str());
			largeArrHtoL[count] = atoi(highToLowLine.c_str());
		}
	}
	else
		cout << "Unable to open one of the data files.\n\n";

	// Done reading the text files, close the input streams to avoid memory problems
	randReader.close(); 	 lowToHighReader.close(); 	   highToLowReader.close();
	medRandReader.close();   medLowToHighReader.close();   medHighToLowReader.close();
	largeRandReader.close(); largeLowToHighReader.close(); largeHighToLowReader.close();

	compareSortMethods(smallArrRand, 100, "100 Random Data Values");
	compareSortMethods(smallArrLtoH, 100, "100 Low-High Data Values");
	compareSortMethods(smallArrHtoL, 100, "100 High-Low Data Values");

	compareSortMethods(medArrRand, 1000, "1,000 Random Data Values");
	compareSortMethods(medArrLtoH, 1000, "1,000 Low-High Data Values");
	compareSortMethods(medArrHtoL, 1000, "1,000 High-Low Data Values");

	compareSortMethods(largeArrRand, 10000, "10,000 Random Data Values");
	compareSortMethods(largeArrLtoH, 10000, "10,000 Low-High Data Values");
	compareSortMethods(largeArrHtoL, 10000, "10,000 High-Low Data Values");

	return 0;
}

// Method that runs the sort methods on the passed input array
// Compares the number of swaps and comparisons of each sorting method
// input[] is the array that has the searches run on it | Description describes the data file
void compareSortMethods(int input[], int size, string description) {
	Sorting test;

	int selectionTemp[size];
	int quickTemp[size];
	int mergeTemp[size];

	// Copy the value of input to each of the temp arrays
	for (int i = 0; i < size; i++) {
		selectionTemp[i] = input[i];
		quickTemp[i] = input[i];
		mergeTemp[i] = input[i];
	}

	cout << "\n\e[4m\e[36mReading from " << description << "\e[0m\n";

	int numSwaps = 0, numComparisons = 0;
	test.selectionSort(selectionTemp, size, numSwaps, numComparisons);
	cout << "\e[32mSelection Sort\e[0m | Swaps: \e[91m" << numSwaps << "\e[0m, Comparisons: \e[91m" << numComparisons << "\e[0m\n";

	int numSwaps2 = 0, numComparisons2 = 0;
	test.quickSort(quickTemp, 0, size - 1, numSwaps2, numComparisons2);
	cout << "\e[33mQuick Sort\e[0m     | Swaps: \e[91m" << numSwaps2 << "\e[0m, Comparisons: \e[91m" << numComparisons2 << "\e[0m\n";

	int numSwaps3 = 0, numComparisons3 = 0;
	test.mergeSort(mergeTemp, 0, size - 1, numSwaps3, numComparisons3);
	cout << "\e[35mMerge Sort\e[0m     | Swaps: \e[91m" << numSwaps3 << "\e[0m, Comparisons: \e[91m" << numComparisons3 << "\e[0m\n";

	cout << "---------------------------------------------------\nLowest Swaps: ";
	// Determine which method used the lowest number of swaps
	(numSwaps < numSwaps2) ? 
		(numSwaps < numSwaps3) ? 
			cout << "\e[32mSelection Sort\e[0m | " << 100*(float)numSwaps/(float)numSwaps2 << "% of Quick, " << 100*(float)numSwaps/(float)numSwaps3 << "% of Merge.\n" :
			cout << "\e[35mMerge Sort\e[0m | " << 100*(float)numSwaps3/(float)numSwaps << "% of Selection, " << 100*(float)numSwaps3/(float)numSwaps2 << "% of Quick.\n" :
		(numSwaps2 < numSwaps3) ?
			cout << "\e[33mQuick Sort\e[0m | " << 100*(float)numSwaps2/(float)numSwaps << "% of Selection, " << 100*(float)numSwaps2/(float)numSwaps3 << "% of Merge.\n" :
			cout << "\e[35mMerge Sort\e[0m | " << 100*(float)numSwaps3/(float)numSwaps << "% of Selection, " << 100*(float)numSwaps3/(float)numSwaps2 << "% of Quick.\n";

	// Determine which method used the lowest number of comparison
	cout << "Lowest Comparisons: ";
	(numComparisons < numComparisons2) ? 
		(numComparisons < numComparisons3) ? 
			cout << "\e[32mSelection Sort\e[0m | " << 100*(float)numComparisons/(float)numComparisons2 << "% of Quick, " << 100*(float)numComparisons/(float)numComparisons3 << "% of Merge.\n" :
			cout << "\e[35mMerge Sort\e[0m | " << 100*(float)numComparisons3/(float)numComparisons << "% of Selection, " << 100*(float)numComparisons3/(float)numComparisons2 << "% of Quick.\n" :
		(numComparisons2 < numComparisons3) ?
			cout << "\e[33mQuick Sort\e[0m | " << 100*(float)numComparisons2/(float)numComparisons << "% of Selection, " << 100*(float)numComparisons2/(float)numComparisons3 << "% of Merge.\n" :
			cout << "\e[35mMerge Sort\e[0m | " << 100*(float)numComparisons3/(float)numComparisons << "% of Selection, " << 100*(float)numComparisons3/(float)numComparisons2 << "% of Quick.\n";


	// Determine which method used the lowest overall number of computations (swaps and comparisons)
	int sum = numSwaps + numComparisons, sum2 = numSwaps2 + numComparisons2, sum3 = numSwaps3 + numComparisons3;
	cout << "Lowest Overall Computations: ";
	(sum < sum2) ? 
		(sum < sum3) ? 
			cout << "\e[32mSelection Sort\e[0m | " << 100*(float)sum/(float)sum2 << "% of Quick, " << 100*(float)sum/(float)sum3 << "% of Merge.\n" :
			cout << "\e[35mMerge Sort\e[0m | " << 100*(float)sum3/(float)sum << "% of Selection, " << 100*(float)sum3/(float)sum2 << "% of Quick.\n" :
		(sum2 < sum3) ?
			cout << "\e[33mQuick Sort\e[0m | " << 100*(float)sum2/(float)sum << "% of Selection, " << 100*(float)sum2/(float)sum3 << "% of Merge.\n" :
			cout << "\e[35mMerge Sort\e[0m | " << 100*(float)sum3/(float)sum << "% of Selection, " << 100*(float)sum3/(float)sum2 << "% of Quick.\n\n";
}