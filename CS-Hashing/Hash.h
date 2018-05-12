/* Hash class header file */
/* Created by Collin Heist */
/* Last Modified 11.14.17 */

#include <string>

using namespace std;

class Hash {
public:
	struct bin {
    /* Initialize values of the bin structure to 'blank' */
		bin (string w = "", int nc = 0, bin * n = nullptr) { 
			word = w;
			elemNum = nc; 
			next = n;
		}
		string word;
		int elemNum;
		bin * next;
	};

  /* Function declarations */
	unsigned int hash(string input);

	bin * findBin(string word, int & count);

	void insertBin(string word);

	void printHashTable();

	void printElementCounts();

	void findMinAndMaxElements(int & min, int & max);

	int countEmptyBins();

	float averageBinCounts();
};
