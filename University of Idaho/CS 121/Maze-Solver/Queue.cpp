/* Queue Implementation File */
/* Collin Heist */
/* CS 121 */

#include "Queue.h"
#include <string>

/* Adds input to the end of the list */
void Queue::addToQueue(std::string input) {
	list.addNode(input);
}

/* Removes the top element from the queue or exits with an error */
std::string Queue::removeFromQueue() {
	if (list.lastElement() == "\0") {
		std::cout << "\e[31m\nTrying to delete a non-existent node in removeFromQueue(), exiting...\n\e[0m";
		throw std::exception();
	}
	return list.deletePos(1); /* Delete the first element of the queue */
}

/* Returns the first character in the queue, or exits with an error */
std::string Queue::peek() {
	if (list.peek() == "\0") { /* If peek returns nullptr, the queue is empty */
		std::cout << "\e[31m\nTrying to access a non-existent node in firstNode(), exiting...\n\e[0m";
		throw std::exception();
	}
	return list.peek();
}

/* Returns the last character in the queue, or exits with an error */
std::string Queue::lastNode() {
	return list.lastElement();
}

/* Returns true or false, whether or not the queue is empty */
bool Queue::isEmpty() {
	return (list.size()) ? false : true;
}

/* Print the queue, from the first node to the last node */
void Queue::printQueue() {
	list.printList();
}

/* Returns the number of elements in the queue */
int Queue::size() {
	return list.size();
}