/* Linked List Implementation File */
/* Collin Heist */
/* CS 121 */

#include "LinkedList.h"

using namespace std;

/* Add a node to the front of the list */
void LinkedList::addNode(char input) {
	node * temp;
	temp = new node;
	temp -> value = input;
	count++;

	if (!head) { /* Empty list, point head to temp, point temp to nothing */
		head = temp;
		temp -> next = nullptr;
	}
	else { /* Non-empty list */
		temp -> next = head; /* Point temp to where head pointed */
		head = temp; /* Redirect head to point to temp, as the first value of our list */
	}
}

/* Peek at the top of our list, returning its value */
char LinkedList::peek() {
	char temp = '\0';
	if (head) /* If our list is non-empty, read the top value */
		temp = head -> value;
	return temp;

}

/* Delete the element containg the input from the list */
void LinkedList::deleteNode(char toDelete) {
	node * previous, * current;
	current = head;
	
	while (current && toDelete != current -> value) { /* Head does not point to NULL, current hasn't found value */
		previous = current; /* Move previous along to where current was */
		current = current -> next; /* Move current along to our next node */
	}

	if (toDelete == current -> value) { /* If current successfully stopped on the value to be deleted */
		if (current == head) /* The value we're deleting is the first value in our list */
			head = head -> next; /* Move head to point to down the line */
		else
			previous -> next = current -> next; /* Essentially skip over where current points */
		delete current;
		count--;
	}
}

/* Outputs the value of each node in our list */
void LinkedList::printList() {
	node * temp = head;
	while (temp) {
		cout << temp -> value << " ";
		temp = temp -> next;
	}
	cout << endl;
}

int LinkedList::size() {
	return count;
}