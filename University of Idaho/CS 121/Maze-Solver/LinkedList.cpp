/* Linked List Implementation File */
/* Collin Heist */
/* CS 121 */

#include "LinkedList.h"
#include <string>

using namespace std;

/* Add a node to the end of the list */
void LinkedList::addNode(string input) {
	node * temp = new node; /* Make a new node */
	temp -> value = input; /* Fill our new node with the value passe to addNode */
	temp -> next = nullptr; /* Since we add to the tail of our list, point temp to nothing */
	count++; /* Increase the size of the list */

	if (!head) { /* If the list is empty */
		head = temp; /* Point head and tail to the temp node */
		tail = temp;
	}
	else {
		tail -> next = temp; /* Point the end of the list to the new node */
		tail = temp; /* Point tail to the new last node, the newest one */
	}
}

/* Delete the nth element of the list, return its value */
string LinkedList::deletePos(int deletePos) {
	string temp = "\0"; /* Initialize temp with a value for debugging */
	node * current, * previous;
	current = head;
	previous = head;
	if (deletePos > count) /* Trying to delete an element that is not in the list  */
		cout << "Trying to delete position " << deletePos << ", which does not exist.\n";
	else { /* Deleting a valid element number */
		if (count == 1) { /* If there is just one element in the list */
			temp = head -> value; /* Grab the value from our one node */
			head = nullptr;
			tail = nullptr;
		}
		else {
			if (deletePos == 1) { /* If we're deleting the first element of the list */
				temp = current -> value;
				head = previous = current -> next;
			}
			else {
				for (int i = 1; i < deletePos; i++) { /* Move to the nth element */
					previous = current;
					current = current -> next;
				}
				if (deletePos == count) /* We're deleting the last element in thel list */
					tail = previous;
				temp = current -> value; /* Grab the value of the nth element */
				previous -> next = current -> next; /* Skip over the nth element */
			}
		}
		delete current; /* Actually delete the node.. memory problems are BAD! */
		count--;
	}
	return temp;
}

/* Peek at the top of the list, returning its value */
string LinkedList::peek() {
	string temp = "\0"; /* Temp string for debugging */
	if (head) /* If the list is non-empty, read the top value */
		temp = head -> value;
	return temp;

}

/* Look at the last element in the list, returning its value */
string LinkedList::lastElement() {
	return (!tail) ? "\0" : tail -> value; /* If tail pointa to nullptr, return null character, otherwise, its value */
}


/* Outputs the value of each node in the list separated by a space */
void LinkedList::printList() {
	node * temp;
	temp = head;
	while (temp) { /* While temp does not point to nullptr */
		cout << temp -> value << ' ';
		temp = temp -> next;
	}
	cout << endl;
}

/* Returns the number of elements in the list */
int LinkedList::size() {
	return count;
}