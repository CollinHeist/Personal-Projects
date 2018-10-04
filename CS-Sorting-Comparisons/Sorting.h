/* Header file for the Sorting class */
/* Made by Collin Heist */
/* Last updated 12.02.17 */

class Sorting {
private:
	void swap(int & x, int & y);
	int subdivideArray(int input[], int lowPos, int highPos, int & numSwaps, int & numComparisons);
	void mergeArrays(int input[], int leftPos, int centerPos, int rightPos, int & numSwaps, int & numComparisons);

public:
	void selectionSort(int input[], int size, int & numSwaps, int & numComparisons);
	void quickSort(int input[], int lowPos, int highPos, int & numSwaps, int & numComparisons);
	void mergeSort(int input[], int leftPos, int rightPos, int & numSwaps, int & numComparisons);
};
