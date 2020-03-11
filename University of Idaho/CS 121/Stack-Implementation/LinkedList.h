/* Linked List Header File */
/* Collin Heist */
/* CS 121 */

#include <iostream>

class LinkedList {
private:
	struct node {
		char value;
		node * next;
	};
	int count;

public:
	node * head;
	LinkedList() {
		head = nullptr; /* Start by pointing head at null */
		count = 0;
	}

	~LinkedList() {
		node * current, * previous;
		current = head;

		/* Delete the nodes in our list */
		while (current) {
			previous = current;
			current = current -> next;
			delete previous;
		}
	}

	/* Add a node to the front of the list */
	void addNode(char input);

	/* Peek at the top of our list, returning its value */
	char peek();

	/* Delete the element containg the input from the list */
	void deleteNode(char toDelete);

	/* Outputs the value of each node in our list */
	void printList();

	int size();
};