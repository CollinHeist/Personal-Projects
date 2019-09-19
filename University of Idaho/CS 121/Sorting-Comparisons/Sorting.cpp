/* Implementation file for the Sorting class */
/* Made by Collin Heist */
/* Last updated 12.04.17 */

#include "Sorting.h"

// Selection sort searching algorithm
void Sorting::selectionSort(int input[], int size, int & numSwaps, int & numComparisons) {
	for (int i = 0; i < size - 1; i++) { // Sort the elements left to right
		int minPos = i;
		for (int j = i + 1; j < size; j++) { // Sort all elements to the right of our boundary
			if (input[j] < input[minPos]) // If the current value is a new lower value 
				minPos = j;
			numComparisons++;
		}
		swap(input[i], input[minPos]);
		numSwaps++;
	}
}

// Recursive quick sort searching algorithm  | Uses the subdivideArray function
void Sorting::quickSort(int input[], int lowPos, int highPos, int & numSwaps, int & numComparisons) {
	if (lowPos < highPos) { // Recurse until the positions are equal (overlap)
		int newSubdivision = subdivideArray(input, lowPos, highPos, numSwaps, numComparisons);
		quickSort(input, lowPos, newSubdivision - 1, numSwaps, numComparisons); // Recurse to the left of the division
		quickSort(input, newSubdivision + 1, highPos, numSwaps, numComparisons); // Recurse to the right of the division
	}
	numComparisons++;
}

// Recursive merge sort algorithms | Uses the mergeArrays function
void Sorting::mergeSort(int input[], int leftPos, int rightPos, int & numSwaps, int & numComparisons) {
	if (leftPos < rightPos) { // The recursion will stop when L = R, i.e. the arrays are 1 element (does nothing), then 2, etc..
		int centerPos = (leftPos + rightPos) / 2; // Integer arithmetic, i.e. the floor of the middle position
		mergeSort(input, leftPos, centerPos, numSwaps, numComparisons); // Recurse the left part of the array
		mergeSort(input, centerPos + 1, rightPos, numSwaps, numComparisons); // Recurse the right part of the array

		mergeArrays(input, leftPos, centerPos, rightPos, numSwaps, numComparisons); // Now that the smallest element array is sorted, begin merging
	}
	numComparisons++;
}

// Simple function to make swapping two variables easier 
void Sorting::swap(int & x, int & y) {
	int temp = x;
	x = y;
	y = temp;
}

// Used by the quickSort algorithm to sort items smaller than the pivot to the left, and
// items larger than the pivot to the right of the pivot
int Sorting::subdivideArray(int input[], int lowPos, int highPos, int & numSwaps, int & numComparisons) {
	int pivot = input[highPos]; // Always split at the right-most element (i.e. the highPos)
	int tempPos = lowPos - 1; // Start at the lowest position (-1 to account for pos != index) and move right

	for (int i = lowPos; i <= highPos - 1; i++) { // Go to highPos - 1 because we only check up TO highPos
		if (input[i] <= pivot) { // If the current element is smaller than our pivot 
			tempPos++;
			swap(input[tempPos], input[i]);
			numSwaps++;
		}
		numComparisons++;
	}
	swap(input[tempPos + 1], input[highPos]);
	numSwaps++;

	return(++tempPos);
}

// Used by the mergeSort function to combine two smaller subarrays whose locations are specified by
// (leftPos, centerPos-1) and (centerPos, rightPos) into a sorted array of the total size
void Sorting::mergeArrays(int input[], int leftPos, int centerPos, int rightPos, int & numSwaps, int & numComparisons) {
	int tempLeftSize = centerPos - leftPos + 1;
	int tempRightSize = rightPos - centerPos;

	// Create temporary arrays to be worked on rather than the input array
	int tempArrayLeft[tempLeftSize];
	int tempArrayRight[tempRightSize];

	for (int i = 0; i < tempLeftSize; i++)
		tempArrayLeft[i] = input[leftPos + i]; // Fill tempArrayLeft with the values from input
	for (int i = 0; i < tempRightSize; i++)
		tempArrayRight[i] = input[centerPos + i + 1]; // Fill tempArrayRight with the values from input

	int leftIndex = 0, rightIndex = 0, mergedPosition = leftPos; // Tracks where in the left, right or 'merging' arrays we are 
	// When this loop is done, either the left or right tempArray's end will have been reached
	while (leftIndex < tempLeftSize && rightIndex < tempRightSize) {
		if (tempArrayLeft[leftIndex] <= tempArrayRight[rightIndex]) { // If the left array's value is smaller than the right's
			input[mergedPosition] = tempArrayLeft[leftIndex]; //Store the left index's value 
			leftIndex++; // Look at the next value of the left array
		}
		else { // The right array's valeu is smaller than the left's 
			input[mergedPosition] = tempArrayRight[rightIndex]; //Store the right index's value 
			rightIndex++; // Look at the next value of the right array
		}
		mergedPosition++; // Independent of which sub-array had the larger value, the correct value is set -> move down
		numSwaps++; // Although a swap was not technically done as we're destructively working on the tempArrays, count it anyway
		numComparisons++;
	}

	// Since we don't know which array finished first (left, right, both) | Copy the remaining values over
	while (leftIndex < tempLeftSize) {  // Finish copying the temporary right array
		input[mergedPosition] = tempArrayLeft[leftIndex];
		leftIndex++;
		mergedPosition++;
		numSwaps++;
	}

	while (rightIndex < tempRightSize) {  // Finish copying the temporary left array
		input[mergedPosition] = tempArrayRight[rightIndex];
		rightIndex++;
		mergedPosition++;
		numSwaps++;
	}
}
