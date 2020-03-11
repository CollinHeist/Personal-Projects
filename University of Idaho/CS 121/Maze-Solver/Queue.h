/* Queue Header File */
/* Collin Heist */
/* CS 121 */

#include "LinkedList.h"
#include <string>

class Queue {
private:
	LinkedList list;

public:
	/* Adds input to the end of the list */
	void addToQueue(std::string input);

	/* Removes the top element from the queue or exits with an error */
	std::string removeFromQueue();

	/* Returns the first character in the queue, or exits with an error */
	std::string peek();

	/* Returns the last character in the queue, or exits with an error */
	std::string lastNode();

	/* Returns true or false, whether or not the queue is empty */
	bool isEmpty();

	/* Print the queue, from the first node to the last node */
	void printQueue();

	/* Returns the number of elements in the queue */
	int size();
};