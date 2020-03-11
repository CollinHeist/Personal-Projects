/* Stack Implementation File */
/* Collin Heist */
/* CS 121 */

#include "Stack.h"

/* Add a node to the top of our stack */
void Stack::addToStack(char input) {
	start.addNode(input); /* start is declared in our header file as a private LinkedList var */
}

/* Remove the top node from our stack, return its value */
char Stack::removeFromStack() {
	char data = '\0'; /* Initialize data to null char in case our list is empty */
	if (start.head) { /* If our list is not empty, delete the top node from our stack */
		data = start.peek(); /* Grab the data in the top node of our list */
		start.deleteNode(data); /* Search through our stack, deleting the node that has 'data' */
	}
	return data;
}

/* Look at the top value of our stack and return its value */
char Stack::peek() {
	char top = '\0';
	if (start.head) 
		top = start.peek();
	return top;
}

/* Return whether or not our stack is empty */
bool Stack::isEmpty() {
	return (start.size() == 0);
}

/* Print the values in our stack, in the order they'd be popped */
void Stack::printStack() {
	start.printList();
}