/* Linked List Header File */
/* Collin Heist */
/* CS 121 */

#include <iostream>
#include <string>

class LinkedList {
private:
	unsigned int count;
	struct node {
		std::string value;
		node * next;
	};

public:
	node * head, * tail;
	LinkedList() {
		head = nullptr; /* Start by pointing head and tail to nullptr */
		tail = nullptr;
		count = 0;
	}

	~LinkedList() {
		node * current, * previous;
		current = head;

		while (current) { /* Delete the nodes in the list */
			previous = current;
			current = current -> next;
			delete previous;
		}
		head = nullptr;
		tail = nullptr;
	}

	/* Add a node to the end of the list */
	void addNode(std::string input);

	/* Delete the nth element of the list, return its value */
	std::string deletePos(int deletePos);

	/* Peek at the top of the list, returning its value */
	std::string peek();

	/* Look at the last element in the list, returning its value */
	std::string lastElement();

	/* Outputs the value of each node in the list separated by a space */
	void printList();

	/* Returns the number of elements in the list */
	int size();
};