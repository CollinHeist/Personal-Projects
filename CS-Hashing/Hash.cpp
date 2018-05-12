/* Hash class implementation file */
/* Made by Collin Heist */
/* Last modified 11.14.17 */

#include "Hash.h"
#include <iostream>
#include <string>

using namespace std;

/* Various hash table sizes | Change to see how the hash table speed adjusts */
// static const int HashTableSize = 101;
// static const int HashTableSize = 8017;
static const int HashTableSize = 11037;
// static const int HashTableSize = 49957;
static Hash::bin * hashTable[HashTableSize];

/* Generate the hash value (index) for a the input string */
unsigned int Hash::hash(string input) {
    unsigned long hashValue = 0;

    for (int i = 0; i < input.length(); i++) /* Hashing algorithm */
        hashValue = input[i] + 31 * hashValue;

    return (hashValue % HashTableSize);
}

/* Find the provided string in the hash table, or return null if it was not found */
/* count tracks how many probes were necessary for the search */
Hash::bin * Hash::findBin(string input, int & count) {
    Hash::bin * temp; /* Initially look at the location the word would be */
    count = 0;
    /* Hash the string, if that bin is full, check it and read its bin buddies
       until the bin is matched or the last bin is read */
    for (temp = hashTable[hash(input)]; temp != nullptr; temp = temp -> next) {
        count++;
        if (input.compare(temp -> word) == 0) /* The word has been found */
            return temp;
    }
    return nullptr;
}

/* Insert the word in the hashTable at the corresponding spot found from hash() */
void Hash::insertBin(string input) {
    int t;
    Hash::bin * temp = findBin(input, t); /* Point temp to bin where it'd be hashed */
    if (!temp) { /* If the word is not in the hash table */
        temp = new Hash::bin;
        temp -> word = input; /* Populate the name field of the new hash with the word */
        unsigned int hashValue = hash(input); /* Generate the hash value */
        temp -> next = hashTable[hashValue]; /* Point the new bin to the old first bin */
        /* If the bin was not empty, increment the elemNum field by +1 | Otherwise = 1*/
        (temp -> next) ? temp -> elemNum = temp -> next -> elemNum + 1 : temp -> elemNum = 1;
        hashTable[hashValue] = temp; /* Insert the bin | Now in the first position */
    } else cout << "\nThe provided word is already in the hash table\n";
}

/* Outputs the hash table, along with every element inside each bin */
void Hash::printHashTable() {
    Hash::bin * temp;
    cout << "\n\e[31m\e[4mHash Table of size " << HashTableSize << ":\n\e[0m";
    for (int i = 0; i < HashTableSize; i++) {
        temp = hashTable[i];
        cout << "\nhashTable[\e[31m" << i << "\e[0m]: ";
        while (temp) {
            cout << temp -> word << ", ";
            temp = temp -> next;
        }
    }
}

/* Outputs how many elements are in each bin of the hash table */
void Hash::printElementCounts() {
    Hash::bin * temp;
    cout << "\n\e[31m\e[4mHash Table:\n\e[0m";
    for (int i = 0; i < HashTableSize; i++) {
        temp = hashTable[i];
        cout << "\nhashTable[\e[31m" << i << "\e[0m] has ";
        (!hashTable[i]) ? cout << "0 elements" : cout << hashTable[i] -> elemNum << " elements";
    }
}

/* Fills min and Max with the minimum and maximum number of elements in throughout the hash table */
void Hash::findMinAndMaxElements(int & min, int & max) {
    Hash::bin * temp;
    min = INT_MAX; max = 0;
    for (int i = 0; i < HashTableSize; i++) {
        if (hashTable[i]) { /* Only access the elemNum field if the spot is non-blank */
            if (hashTable[i] -> elemNum < min) min = hashTable[i] -> elemNum;
            if (hashTable[i] -> elemNum > max) max = hashTable[i] -> elemNum;
        }
        else min = 0; /* A blank entry in the hash table means the min is 0 */
    }
}

/* Returns the number of empty bins in the hashTable */
int Hash::countEmptyBins() {
    Hash::bin * temp;
    int count = 0;
    for (int i = 0; i < HashTableSize; i++) {
        if (!hashTable[i]) count++;
    }
    return count;
}

/* Returns the average number of elements in each bin of the hash table */
float Hash::averageBinCounts() {
    Hash::bin * temp;
    unsigned int sum = 0;
    for (int i = 0; i < HashTableSize; i++) {
        if (hashTable[i]) sum += hashTable[i] -> elemNum;
    }
    return ((float)sum / (float)HashTableSize);
}
