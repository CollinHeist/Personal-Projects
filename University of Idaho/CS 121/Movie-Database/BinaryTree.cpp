/* Binary Search Tree Implementation File */
/* Made by Collin Heist */ 
/* Last modified 10.24.17 */

#include <iostream>
#include "BinaryTree.h"

/* Deletes the tree | Begins at the title tree's root  */
void BinaryTree::deleteTree(BinaryTree::node * leaf) {
	if (leaf) {
		deleteTree(leaf -> titleLeft); /* Recursively delete all left nodes */
		deleteTree(leaf -> titleRight); /* Recursively delete all right nodes */
		delete leaf; /* Delete the node itself */
		leaf = nullptr;
	}
}

/* Method to test if a passed node's dataType section has any children */
/* dataType is 0, 1, or 2 | Corresponding to title, actors[], and year */
bool BinaryTree::isLeaf(BinaryTree::node * leaf, int dataType) {
	if (dataType == 0)
		return (!leaf -> titleLeft && !leaf -> titleRight);
	else if (dataType == 1)
		return (!leaf -> actorsLeft && !leaf -> actorsRight);
	else
		return (!leaf -> yearLeft && !leaf -> yearRight);
}

/* Pointer method to delete a node containing a given title */
/* Recursively traverses the tree to find the node, then calls reassignAndDelete */
void BinaryTree::deleteNode(BinaryTree::node * leaf, string title) {
	if (!leaf) { /* The leaf does not point to a node */
		std::cout << "\e[91mTrying to delete from blank node!\n\e[0m";
	}
	else if (title.compare(leaf -> title) == 0) { /* The passed node is the one being deleted */
		if (leaf == titleRoot || leaf == actorsRoot || leaf == yearRoot) { /* Specific deletion for the root pointer */
			/* Only COMPLETELY delete the node if all 3 data fields have no children */
			if (isLeaf(leaf, 0) && isLeaf(leaf, 1) && isLeaf(leaf, 2))
				delete leaf; /* Only one node in the tree, and it has no children*/
			else
				reassignAndDelete(leaf);
		}
		else { reassignAndDelete(leaf); } /* Restructures the tree, deleting the node */
	}
	else if (title.compare(leaf -> title) < 0) { /* The passed node's title comes later in the alphabet */
		deleteNode(leaf -> titleLeft, title); /* Look at the passed node's title left position */
	}
	else { /* The current node's title comes earlier in the alphabet */
		deleteNode(leaf -> titleRight, title); /* Look at the passed node's title right position */
	}
}

/* Delete a specific node, resassigning the parents correctly */
/* Does not work if the deletion is done on the root */
void BinaryTree::reassignAndDelete(BinaryTree::node * leaf) {
	/* Only COMPLETELY delete the node if all 3 data fields have no children */
	if (isLeaf(leaf, 0) && isLeaf(leaf, 1) && isLeaf(leaf, 2)) {
		(leaf -> titleParent -> titleLeft == leaf) ? leaf -> titleParent -> titleLeft = nullptr : leaf -> titleParent -> titleRight = nullptr;
		(leaf -> actorsParent -> actorsLeft == leaf) ? leaf -> actorsParent -> actorsLeft = nullptr : leaf -> actorsParent -> actorsRight = nullptr;
		(leaf -> yearParent -> yearLeft == leaf) ? leaf -> yearParent -> yearLeft = nullptr : leaf -> yearParent -> yearRight = nullptr;
		delete leaf;
		return; /* Immediately exit the function */
	}

	/* If structure to reassign the title field */
	/* The title data field is childless */
	/* Don't need to worry about the childless root pointer | If one data field is childless, they all are */
	if (!leaf -> titleLeft && !leaf -> titleRight) {
		if (leaf != titleRoot) /* Point the title parent's left or right children to null */
			(leaf -> titleParent -> titleLeft == leaf) ? leaf -> titleParent -> titleLeft = nullptr : leaf -> titleParent -> titleRight = nullptr;
	}
	/* The title data field only has a left child */
	else if (!leaf -> titleRight) {
		if (leaf != titleRoot) { /* The leaf being deleted is not the root of the title BST */
			leaf -> titleLeft -> titleParent = leaf -> titleParent; /* Reassign the only child's parent */
			(leaf -> titleParent -> titleLeft == leaf) ? leaf -> titleParent -> titleLeft = leaf -> titleLeft : leaf -> titleParent -> titleRight = leaf -> titleLeft;
		}
		else { /* The leaf being deleted is the root of the title BST */
			BinaryTree::node * replacement;
			replacement = findReplacement(leaf, 0);

			/* Has a left node, and our replacement is not the child of the root */
			if (replacement -> titleLeft && replacement -> titleParent != leaf) {
				replacement -> titleLeft -> titleParent = replacement -> titleParent;
				if (replacement -> titleParent -> titleLeft == replacement) 
					replacement -> titleParent -> titleLeft = replacement -> titleLeft;
				else
					replacement -> titleParent -> titleRight = replacement -> titleLeft;
			}

			if (replacement -> titleParent != leaf) {
				leaf -> titleLeft -> titleParent = replacement;
				replacement -> titleLeft = leaf -> titleLeft;
			}

			titleRoot = replacement;
		}
	}
	/* The title data field only has a right child */
	else if (!leaf -> titleLeft) {
		if (leaf != titleRoot) {
			leaf -> titleRight -> titleParent = leaf -> titleParent; /* Reassign the only child's parent */
			(leaf -> titleParent -> titleLeft == leaf) ? leaf -> titleParent -> titleLeft = leaf -> titleRight : leaf -> titleParent -> titleRight = leaf -> titleRight;
		}
		else { /* The leaf being deleted is the root of our title BST */
			BinaryTree::node * replacement;
			replacement = findReplacement(leaf, 0);

			/* Has a left node, and our replacement is not the child of the root */
			if (replacement -> titleLeft && replacement -> titleParent != leaf) {
				replacement -> titleLeft -> titleParent = replacement -> titleParent;
				/* Either point the repl. parent's left or right field to the repl.'s child*/
				if (replacement -> titleParent -> titleLeft == replacement)
					replacement -> titleParent -> titleLeft = replacement -> titleLeft;
				else
					replacement -> titleParent -> titleRight = replacement -> titleLeft;
			}

			if (replacement -> titleParent != leaf) {
				leaf -> titleRight -> titleParent = replacement;
				replacement -> titleRight = leaf -> titleRight;
			}

			titleRoot = replacement;
		}
	}
	/* The title data field has two children */
	/* After finding a new node, the node being deleted's parent, left and right subtrees, */
	/* as well as the new node's parent and subtrees must be changed */
	/* The new node is the largest node in the left subtree */
	else {
		BinaryTree::node * replacement;
		replacement = findReplacement(leaf, 0); /* Search through the left subtree for the largest node */
		
		if (leaf != titleRoot) {
			/* Depending on whether or not leaf is the left or right subtree of its parent, change that to replacement */
			(leaf -> titleParent -> titleLeft == leaf) ? leaf -> titleParent -> titleLeft = replacement : leaf -> titleParent -> titleRight = replacement;
			leaf -> titleLeft -> titleParent = replacement; /* Change the left tree to now point to our replacement */
			leaf -> titleRight -> titleParent = replacement; /* Change the right tree to now point to the replacement */

			replacement -> titleParent -> titleRight = replacement -> titleLeft; /* Have the new node's parent point to the new node's child */
			/* If the replacement node has a child (left child), make that child's parent the replacement's old parent */
			if (replacement -> titleLeft && replacement -> titleParent != leaf)
				replacement -> titleLeft -> titleParent = replacement -> titleParent;

			if (leaf -> titleLeft != replacement) replacement -> titleLeft = leaf -> titleLeft; /* New node has the old node's left subtree */
			if (leaf -> titleRight != replacement) replacement -> titleRight = leaf -> titleRight; /* New node has the old node's right subtree */
			replacement -> titleParent = leaf -> titleParent; /* New node's parent is the old node's parent */
		}
		else {
			if (replacement -> titleLeft && replacement -> titleParent != leaf) {
				replacement -> titleLeft -> titleParent = replacement -> titleParent;
				/* Either point the repl. parent's left or right field to the repl.'s child*/
				if (replacement -> titleParent -> titleLeft == replacement)
					replacement -> titleParent -> titleLeft = replacement -> titleLeft;
				else
					replacement -> titleParent -> titleRight = replacement -> titleLeft;
			}

			if (replacement -> titleParent != leaf) {
				leaf -> titleRight -> titleParent = replacement;
				leaf -> titleLeft -> titleParent = replacement;
				replacement -> titleRight = leaf -> titleRight;
				replacement -> titleLeft = leaf -> titleLeft;
			}

			titleRoot = replacement;
		}
	}
	leaf -> title = "PARTIALLY DELETED"; /* Used for debugging | If this pops up, pointers were not correctly changed */

	/* If structure to reassign the actors field */
	/* The actors data field is childless */
	if (!leaf -> actorsLeft && !leaf -> actorsRight) {
		if (leaf != actorsRoot)  /* Point the actors parent's left or right children to null */
			(leaf -> actorsParent -> actorsLeft == leaf) ? leaf -> actorsParent -> actorsLeft = nullptr : leaf -> actorsParent -> actorsRight = nullptr;
	}
	/* The actors data field only has a left child */
	else if (!leaf -> actorsRight) {
		if (leaf != actorsRoot) {
			leaf -> actorsLeft -> actorsParent = leaf -> actorsParent; /* Reassign the only child's parent */
			(leaf -> actorsParent -> actorsLeft == leaf) ? leaf -> actorsParent -> actorsLeft = leaf -> actorsLeft : leaf -> actorsParent -> actorsRight = leaf -> actorsLeft;
		}
		else { /* The leaf being deleted is the root of the title BST */
			BinaryTree::node * replacement;
			replacement = findReplacement(leaf, 1);

			/* Has a left node, and our replacement is not the child of the root */
			if (replacement -> actorsLeft && replacement -> actorsParent != leaf) {
				replacement -> actorsLeft -> actorsParent = replacement -> actorsParent;
				if (replacement -> actorsParent -> actorsLeft == replacement) 
					replacement -> actorsParent -> actorsLeft = replacement -> actorsLeft;
				else
					replacement -> actorsParent -> titleRight = replacement -> actorsLeft;
			}

			if (replacement -> actorsParent != leaf) {
				leaf -> actorsLeft -> actorsParent = replacement;
				replacement -> actorsLeft = leaf -> actorsLeft;
			}

			titleRoot = replacement;
		}
	}
	/* The actors data field only has a right child */
	else if (!leaf -> actorsLeft) {
		if (leaf != actorsRoot) {
			leaf -> actorsRight -> actorsParent = leaf -> actorsParent; /* Reassign the only child's parent */
			(leaf -> actorsParent -> actorsLeft == leaf) ? leaf -> actorsParent -> actorsLeft = leaf -> actorsRight : leaf -> actorsParent -> actorsRight = leaf -> actorsRight;
		}
		else { /* The leaf being deleted is the root of our title BST */
			BinaryTree::node * replacement;
			replacement = findReplacement(leaf, 1);

			/* Has a left node, and our replacement is not the child of the root */
			if (replacement -> actorsLeft && replacement -> actorsParent != leaf) {
				replacement -> actorsLeft -> actorsParent = replacement -> actorsParent;
				/* Either point the repl. parent's left or right field to the repl.'s child*/
				if (replacement -> actorsParent -> actorsLeft == replacement)
					replacement -> actorsParent -> actorsLeft = replacement -> actorsLeft;
				else
					replacement -> actorsParent -> actorsRight = replacement -> actorsLeft;
			}

			if (replacement -> actorsParent != leaf) {
				leaf -> actorsRight -> actorsParent = replacement;
				replacement -> actorsRight = leaf -> actorsRight;
			}

			titleRoot = replacement;
		}
	}
	/* The actors data field has two children */
	else {
		BinaryTree::node * replacement;
		replacement = findReplacement(leaf, 1); /* Search through the left subtree for the largest node */
		
		if (leaf != actorsRoot)	{
			/* Depending on whether or not leaf is the left or right subtree of its parent, change that to replacement */
			(leaf -> actorsParent -> actorsLeft == leaf) ? leaf -> actorsParent -> actorsLeft = replacement : leaf -> actorsParent -> actorsRight = replacement;
			leaf -> actorsLeft -> actorsParent = replacement; /* Change the left tree to now point to our replacement */
			leaf -> actorsRight -> actorsParent = replacement; /* Change the right tree to now point to the replacement */

			replacement -> actorsParent -> actorsRight = replacement -> actorsLeft; /* Have the new node's parent point to the new node's child */
			if (replacement -> actorsLeft && replacement -> actorsParent != leaf) /* If the replacement node has a child (left child), make that child's parent the replacement's old parent */
				replacement -> actorsLeft -> actorsParent = replacement -> actorsParent;

			if (leaf -> actorsLeft != replacement) replacement -> actorsLeft = leaf -> actorsLeft; /* New node has the old node's left subtree */
			if (leaf -> actorsRight != replacement) replacement -> actorsRight = leaf -> actorsRight; /* New node has the old node's right subtree */
			replacement -> actorsParent = leaf -> actorsParent; /* New node's parent is the old node's parent */
		}
		else {
			if (replacement -> actorsLeft && replacement -> actorsParent != leaf) {
				replacement -> actorsLeft -> actorsParent = replacement -> actorsParent;
				/* Either point the repl. parent's left or right field to the repl.'s child*/
				if (replacement -> actorsParent -> actorsLeft == replacement)
					replacement -> actorsParent -> actorsLeft = replacement -> actorsLeft;
				else
					replacement -> actorsParent -> actorsRight = replacement -> actorsLeft;
			}

			if (replacement -> actorsParent != leaf) {
				leaf -> actorsRight -> actorsParent = replacement;
				leaf -> actorsLeft -> actorsParent = replacement;
				replacement -> actorsRight = leaf -> actorsRight;
				replacement -> actorsLeft = leaf -> actorsLeft;
			}

			actorsRoot = replacement;
		}	
	}
	leaf -> actors = "PARTIALLY DELETED"; /* Used for debugging | If this pops up, pointers were not correctly changed */

	/* If structure to reassign the year field */
	/* The year data field is childless */
	if (!leaf -> yearLeft && !leaf -> yearRight)
		(leaf -> yearParent -> yearLeft == leaf) ? leaf -> yearParent -> yearLeft = nullptr : leaf -> yearParent -> yearRight = nullptr; /* Point the year parent to null */
	else if (!leaf -> yearRight) { /* The year data field only has a left child */
		if (leaf != yearRoot) {
			leaf -> yearLeft -> yearParent = leaf -> yearParent; /* Reassign the only child's parent */
			(leaf -> yearParent -> yearLeft == leaf) ? leaf -> yearParent -> yearLeft = leaf -> yearLeft : leaf -> yearParent -> yearRight = leaf -> yearLeft;
		}
		else { /* The leaf being deleted is the root of the title BST */
			BinaryTree::node * replacement; /* Replaces the node that is being deleted */
			replacement = findReplacement(leaf, 2);

			/* Has a left node, and our replacement is not the child of the root */
			if (replacement -> yearLeft && replacement -> yearParent != leaf) {
				replacement -> yearLeft -> yearParent = replacement -> yearParent;
				if (replacement -> yearParent -> yearLeft == replacement) 
					replacement -> yearParent -> yearLeft = replacement -> yearLeft;
				else
					replacement -> yearParent -> yearRight = replacement -> yearLeft;
			}

			if (replacement -> yearParent != leaf) {
				leaf -> yearLeft -> yearParent = replacement;
				replacement -> yearLeft = leaf -> yearLeft;
			}

			yearRoot = replacement;
		}
	}
	else if (!leaf -> yearLeft) { /* The year data field only has a right child */
		if (leaf != yearRoot) { /* Not deleting the root of the year BST */
			leaf -> yearRight -> yearParent = leaf -> yearParent; /* Reassign the only child's parent */
			(leaf -> yearParent -> yearRight == leaf) ? leaf -> yearParent -> yearLeft = leaf -> yearRight : leaf -> yearParent -> yearRight = leaf -> yearRight;
		}
		else { /* The leaf being deleted is the root of our title BST */
			BinaryTree::node * replacement; /* Replaces the node that is being deleted */
			replacement = findReplacement(leaf, 2);

			/* Has a left node, and our replacement is not the child of the root */
			if (replacement -> yearLeft && replacement -> yearParent != leaf) {
				replacement -> yearLeft -> yearParent = replacement -> yearParent;
				/* Either point the repl. parent's left or right field to the repl.'s child*/
				if (replacement -> yearParent -> yearLeft == replacement)
					replacement -> yearParent -> yearLeft = replacement -> yearLeft;
				else
					replacement -> yearParent -> yearRight = replacement -> yearLeft;
			}

			if (replacement -> yearParent != leaf) {
				leaf -> yearRight -> yearParent = replacement;
				replacement -> yearRight = leaf -> yearRight;
			}

			yearRoot = replacement;
		}
	}
	/* The year data field has two children */
	else {
		BinaryTree::node * replacement; /* Replaces the node that is being deleted */
		replacement = findReplacement(leaf, 2); /* Search through the left subtree for the largest node */
		
		if (leaf != yearRoot) { /* Deleting a node that is not the root of the year BST */
			/* Depending on whether or not leaf is the left or right subtree of its parent, change that to replacement */
			(leaf -> yearParent -> yearLeft == leaf) ? leaf -> yearParent -> yearLeft = replacement : leaf -> yearParent -> yearRight = replacement;
			leaf -> yearLeft -> yearParent = replacement; /* Change the left tree to now point to our replacement */
			leaf -> yearRight -> yearParent = replacement; /* Change the right tree to now point to the replacement */

			replacement -> yearParent -> yearRight = replacement -> yearLeft; /* Have the new node's parent point to the new node's child */
			/* If the replacement node has a child (left child), make that child's parent the replacement's old parent */
			if (replacement -> yearLeft && replacement -> yearParent != leaf)
				replacement -> yearLeft -> yearParent = replacement -> yearParent;

			if (leaf -> yearLeft != replacement) replacement -> yearLeft = leaf -> yearLeft; /* New node has the old node's left subtree */
			if (leaf -> yearRight != replacement) replacement -> yearRight = leaf -> yearRight; /* New node has the old node's right subtree */
			replacement -> yearParent = leaf -> yearParent; /* New node's parent is the old node's parent */
		}
		else { /* Deleting the root of the year BST */
			if (replacement -> yearLeft && replacement -> yearParent != leaf) {
				replacement -> yearLeft -> yearParent = replacement -> yearParent;
				/* Either point the repl. parent's left or right field to the repl.'s child*/
				if (replacement -> yearParent -> yearLeft == replacement)
					replacement -> yearParent -> yearLeft = replacement -> yearLeft;
				else
					replacement -> yearParent -> yearRight = replacement -> yearLeft;
			}

			if (replacement -> yearParent != leaf) {
				leaf -> yearRight -> yearParent = replacement;
				leaf -> yearLeft -> yearParent = replacement;
				replacement -> yearRight = leaf -> yearRight;
				replacement -> yearLeft = leaf -> yearLeft;
			}

			titleRoot = replacement;
		}
	}
	leaf -> year = -100; /* Used for debugging | If -100 pops up, pointers were not correctly changed */
}

/* Return pointer to the rightmost node of the given leaf's left subtree | Or the first right child */
BinaryTree::node * BinaryTree::findReplacement(node * leaf, int dataType) {
	BinaryTree::node * temp = leaf;
	if (dataType == 0) { /* Finding suitable replacement for title data */
		if (leaf -> titleLeft) { 
			temp = temp -> titleLeft; /* Go to the left-node first, if possible */
			while (temp -> titleRight) 
				temp = temp -> titleRight;
		}
		else temp = temp -> titleRight;
		return temp; 
	}
	else if (dataType == 1) { /* Finding suitable replacement for actors data */
		if (leaf -> actorsLeft) {
			temp = temp -> actorsLeft;
			while (temp -> actorsRight) 
				temp = temp -> actorsRight;
		}
		else temp = temp -> actorsRight;
		return temp;
	}
	else { /* Find suitable replacement for the year data */
		if (leaf -> yearLeft) {
			temp = temp -> yearLeft;
			while (temp -> yearRight) 
				temp = temp -> yearRight;
		}
		else temp = temp -> yearRight;
		return temp;
	}
}

/* Add the provided data into the BSTs */
/* Does not add movies of the same name, but will allow for duplicate years and actors */
void BinaryTree::addNode(string t, string a, int y) {
	BinaryTree::node * newMovie;
	newMovie = new node(t, a, y); /* Initializes the movie to have the provided title, actors, and year */
	
	/* If any of the BSTs are empty, they all are | Initialize them to point to newMovie */
	if (!titleRoot) titleRoot = newMovie;
	if (!actorsRoot) actorsRoot = newMovie;
	if (!yearRoot) yearRoot = newMovie;
	else { /* Non-empty BST */
		/* Locate and place the title data field */
		BinaryTree::node * traversal = titleRoot;
		BinaryTree::node * target;
		while (traversal) { /* While we haven't reached the end of any subtree */
			target = traversal;
			if (t == traversal -> title) /* If the movie title is already a part of our list | Do nothing */
				return;
			else if (t.compare(traversal -> title) < 0) /* The new title comes before the current entry */
				traversal = traversal -> titleLeft;
			else /* The new title comes after the current entry */
				traversal = traversal -> titleRight;
		}
		/* target is the pointer to the parent of the new node */
		(t.compare(target -> title) < 0) ? target -> titleLeft = newMovie : target -> titleRight = newMovie;
		newMovie -> titleParent = target; /* Mark the target as the new node's parent */

		/* Locate and place the actors data field */
		traversal = actorsRoot;
		while (traversal) { /* While we haven't reached the end of any subtree */
			target = traversal;
			if (a.compare(traversal -> actors) < 0) /* The first actor comes before the current first actor */
				traversal = traversal -> actorsLeft;
			else /* If it is either a duplicate actor or an actor that comes after the current, traverse right */
				traversal = traversal -> actorsRight;
		}
		(a.compare(target -> actors) < 0) ? target -> actorsLeft = newMovie : target -> actorsRight = newMovie;
		newMovie -> actorsParent = target; /* Mark the target as the new node's parent */
		
		/* Locate and place the year data field */
		traversal = yearRoot;
		while (traversal) { /* While we haven't reached the end of any subtree */
			target = traversal;
			if (y < traversal -> year) /* The new year comes before the current year */
				traversal = traversal -> yearLeft; 
			else /* If it is either a duplicate year or an year that comes after the current, traverse right */
				traversal = traversal -> yearRight;
		}
		/* target is the pointer to the parent of the new node */
		(y < target -> year) ? target -> yearLeft = newMovie : target -> yearRight = newMovie;
		newMovie -> yearParent = target; /* Mark the target as the new node's parent */
	}
}

/* Finds the first node that contains the provided year, and then prints every movie with that year */
void BinaryTree::findYear(int year) {
	BinaryTree::node * traversal;
	traversal = yearRoot; /* Begin at the root of the year BST */
	bool found = false;
	while (traversal && !found) { /* Point traversal to the movie of the matching title */
		if (traversal -> year == year)
			found = true;
		else if (traversal -> year < year)
			traversal = traversal -> yearRight;
		else
			traversal = traversal -> yearLeft;
	}
	if (found) {
		std::cout << "\e[4m\e[31mMovies Released in " << year << ":\n\e[0m";
		while (traversal) { /* Keep cyling through the right subtree of traversal in case there are duplicates */
			if (traversal -> year == year) {
				std::cout << traversal -> title << endl;
				traversal = traversal -> yearRight; /* Movies with equivalent years are stored to the right */
			}
			else break;
		}
	}
	else
		cout << "The provided year has no corresponding movies.\n\n";
}

/* Lists all the actors of the provided movie title */
void BinaryTree::listActors(string title) {
	BinaryTree::node * traversal;
	traversal = titleRoot; /* Begin at the root of the title BST */
	bool found = false;
	while (traversal && !found) { /* Point traversal to the movie of the matching title */
		if (traversal -> title == title)
			found = true;
		else if (title.compare(traversal -> title) > 0) /* The passed title comes later in the alphabet */
			traversal = traversal -> titleRight;
		else
			traversal = traversal -> titleLeft;
	}
	if (found)
		std::cout << "\e[4m\e[31mActors in \"" << title << "\":\e[0m " << traversal -> actors << '\n';
	else
		std::cout << "The provided movie title could not be found.\n";
}

/* Recursively searches through each node for the provided actor | Outputs the title of the movie if the actor is found */
void BinaryTree::findActor(BinaryTree::node * leaf, string actor, bool & found) {
	if (leaf) {
		if (leaf -> actors.find(actor) != string::npos) { /* .find returns string::npos if the actor was not found */
			cout << leaf -> title << endl;
			found = true;
		}
		findActor(leaf -> actorsLeft, actor, found);
		findActor(leaf -> actorsRight, actor, found);
	}
}

/* Starting at the passed node print left, node, then the right | dataType (0, 1, 2) is title, actors, year */
void BinaryTree::printInOrder(BinaryTree::node * leaf, int dataType) {
	if (leaf) {
		if (dataType == 0) { /* Print the title BST */
			printInOrder(leaf -> titleLeft, dataType); /* Print the left subtree */
			std::cout << leaf -> title << std::endl; /* Print the root */
			printInOrder(leaf -> titleRight, dataType); /* Print the right subtree */
		}
		else if (dataType == 1) { /* Print the actors BST */
			printInOrder(leaf -> actorsLeft, dataType);
			std::cout << leaf -> actors << std::endl;
			printInOrder(leaf -> actorsRight, dataType);
		}
		else { /* Print the year BST */
			printInOrder(leaf -> yearLeft, dataType);
			std::cout << leaf -> year << std::endl;
			printInOrder(leaf -> yearRight, dataType);
		}
	}
}
