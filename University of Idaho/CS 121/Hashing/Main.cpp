/* Main implementation file */
/* Run and compile this with "clang -stdlib=libc++ -std=c++11 -lc++ Main.cpp Hash.cpp" */
/* Made by Collin Heist */
/* Last Modified 11.14.17 */
 
#include <iostream>
#include <string>
#include <fstream>
#include <time.h>
#include <random>
#include "Hash.h"

using namespace std;

int main(int inCount, char ** dataFile) {  
    Hash test;

    ifstream reader;
    if (inCount > 1) 
        reader.open(dataFile[1]); /* Read the file name passed as parameter as the one to read */

    if (reader.is_open() && inCount > 1) { /* If the data file was properly opened */
        /* Used to randomly select words to find from the hash */
        random_device rd;
        mt19937 dir(rd());
        uniform_real_distribution<float> dist(0.0, 10000.0);
        int count = 0;
        string probeStrings[100]; /* Stores what words we'll be searching through the hash for | Max size is 100 */

        string line = "";
        float weight = (strcmp(dataFile[1], "dict4.txt") == 0) ? 2.5 : 5.0; /* Scaled to grab ~15 words from each file */
        while (getline(reader, line)) { /* Add each line to the hash */
            if (dist(dir) <= weight) { probeStrings[count] = line; count++; } /* Scaled % chance to add the word to the search array */
            test.insertBin(line);
        }

        // test.printHashTable(); cout << '\n';
        // test.printElementCounts(); cout << '\n';
        int min, max;
        test.findMinAndMaxElements(min, max);
        cout << "\nMin: \e[31m" << min << "\e[0m, Max: \e[31m" << max << "\e[0m\n";
        // cout << "\nMin: " << min << ", Max: " << max << "\n\n";

        cout << "Number of empty bins: \e[31m" << test.countEmptyBins() << "\e[0m\n";
        cout << "Average per bin element count: \e[31m" << test.averageBinCounts() << "\e[0m\n\n";

        int probeCount;
        for (int i = 0; i < count; i++) {
            test.findBin(probeStrings[i], probeCount);
            cout << "Finding \'\e[34m" << probeStrings[i] << "\e[0m\' took \e[31m" << probeCount << "\e[0m probe(s)\n";
            // cout << "Finding \'" << probeStrings[i] << "\' took " << probeCount << " probe(s)\n";
        }
    }
    else (inCount > 1) ? cout << "\nUnable to read " << dataFile[1] << '\n' : cout << "\nNo data-file was entered\n";

    return 1;
}
