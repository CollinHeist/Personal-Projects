/* Binary Search Tree Header File */
/* Collin Heist */
/* CS 121 - 10/24/2017 */

#include <string>
using namespace std; /* Need for std::string */

class BinaryTree {
private:
	struct node {
		 /* Initialize these values for debugging */
		node (string t = "TEMP", string a = "TEMP, TEMP, TEMP", int y = -1, node * tl = nullptr, 
			  node * tr = nullptr, node * al = nullptr, node * ar = nullptr, node * yl = nullptr,
			  node * yr = nullptr, node * tp = nullptr, node * ap = nullptr, node * yp = nullptr) {

			title = t;
			actors = a;
			year = y;

			titleLeft = tl; 	titleRight = tr;
			actorsLeft = al; 	actorsRight = ar;
			yearLeft = yl;		yearRight = yr;
			titleParent = tp;	actorsParent = ap;	yearParent = yp;
		}
		~node () {
			title = "DEALLCOATION"; actors = "DEALLOCATION"; year = -999;
		}
		string title; /* Movie title */
		string actors; /* String of actor names separated by commas */
		int year; /* Int corresponding to the year of the movie's release */

		/* Pointers that point to the nodes in the left or right subtree for each data field */
		node * titleLeft, * titleRight;
		node * actorsLeft, * actorsRight;
		node * yearLeft, * yearRight;

		/* Pointers to the parents for each data field */
		node * titleParent;
		node * actorsParent;
		node * yearParent;
	};
	/* Since there are three interconnected BSTs for each data field, we need three pointers for three roots */
	node * titleRoot, * actorsRoot, * yearRoot;

	/* Creation of the tree that initializes the root pointers to null */
	void initializeTree() { titleRoot = nullptr; actorsRoot = nullptr; yearRoot = nullptr; }
	
	/* Destruction of the tree begins by deleting from the title node downward | Can start from any root */
	void deleteTree(node * leaf);

	/* Returns true if the passed leaf has no children | dataType is either 0, 1, or 2 and corresponds to title, actors, or year */
	bool isLeaf(node * leaf, int dataType);

	/* Delete a movie of a given title | Deletes from title because years and actors aren't necessarily unique */
	void deleteNode(node * leaf, string title);

	 /* Delete the passed node | Restructures all three of the BSTs */
	void reassignAndDelete(node * leaf);

	/* Return a pointer to the node that's best for replacing a given node | Usually the rightmost node in the left subtree */
	node * findReplacement(node * leaf, int dataType);

	/* Recursively searches through each node for the provided actor | Outputs the title of the movie if the actor is found */
	void findActor(node * leaf, string actor, bool & found);

	/* Prints a given BST inOrder (left, node, right) | dataType is either 0, 1 or 2 for title, actors, or year */
	void printInOrder(node * leaf, int dataType);

public:
	BinaryTree() { initializeTree(); }

	~BinaryTree() { deleteTree(titleRoot); }

	void deleteNode(string title) { deleteNode(titleRoot, title); }

	/* Add a movie with the provided information to the respective BSTs */
	void addNode(string title, string actors, int year);

	/* Finds the first node that contains the provided year, and then prints every movie with that year */
	void findYear(int year);

	/* List all the actors of a given movie title */
	void listActors(string title);

	/* Finds the first node that contains the given actor, and then prints every movie with that actor */
	void findActor(string actor) {
		cout << "\e[4m\e[31mMovies With " << actor << ":\n\e[0m";
		bool found = false;
		findActor(actorsRoot, actor, found);
		if(!found) {
			std::cout << "The provided actor has no associated movies..\n";
		}
	}

	/* Public printInOrder method */
	void printInOrder(int dataType) {
		(dataType == 0) ? printInOrder(titleRoot, 0) : (dataType == 1) ? printInOrder(actorsRoot, 1) : printInOrder(yearRoot, 2);
	}
};