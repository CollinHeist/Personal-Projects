/* Stack Header File */
/* Collin Heist */
/* CS 121 */

#include "LinkedList.h"

class Stack {
public:
	/* Add a node to the top of our stack */
	void addToStack(char input);

	/* Remove the top node from our stack, return its value */
	char removeFromStack();

	/* Look at the top value of our stack and return its value */
	char peek();

	/* Return whether or not our stack is empty */
	bool isEmpty();

	/* Print the values in our stack, in the order they'd be popped */
	void printStack();
private:
	LinkedList start;
};