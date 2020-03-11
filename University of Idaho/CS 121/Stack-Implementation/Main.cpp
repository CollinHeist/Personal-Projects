/* Main File */
/* Collin Heist */
/* CS 121 */

#include <iostream>
#include <string>
#include "Stack.h"

using namespace std;

bool isOperator(char input);
bool isHigherPrecedence(char top, char token);
bool isValid(string input);
void infixToPostfix(string rawInput, string input);

int main() {
	string rawInput = ""; /* Where we'll be storing the typed input, initialized to "" so our loop runs */
	cout << "\nEnter \"quit\" to exit.\n";

	while (rawInput != "quit") { /* Run until the user enters "quit" */
		cout << "Enter a valid infix expression.. "; /* Prompt for input */
		getline(cin, rawInput); /* rawInput now equals what the user entered */
		if (rawInput != "quit") {
			string input = rawInput; /* We need rawInput unchanged, so we'll work on input */
			input.erase(remove(input.begin(), input.end(), ' '), input.end()); /* Clear spaces from input */

			if (isValid(input)) /* If our input is invalid, ask again */
				infixToPostfix(rawInput, input); /* Covert input to a postfix expression and prints it */
			else
				cout << "Invalid Input, please only enter numbers, operators or parenthesis.\n\numbers";
		}
	}
	cout << "\n\nSuccessfully exited program.\n\n";

	return 0;
}

/* Returns true if the input character is a valid operator */
bool isOperator(char input) {
	return ((input == '*') || (input == '/') || (input == '+') || (input == '-') || (input == '^') || (input == '%'));
}

/* Function that returns true if top is higher (or equal) precedence to token */
bool isHigherPrecedence(char top, char token) {
	if (top == '^') /* Power always has top precedence */
		return true;
	else if (token == '^') /* Power always has top precedence */
		return false;
	else if (top == '*' || top == '/' || top == '%')
		return true;
	else if (token == '*' || token == '/' || token == '%')
		return false;

	return true; /* At this point, top and token are both + or - (equal) */
}

/* Returns true if each char in input is a digit, operator, '(' or ')' */
bool isValid(string input) {
	for (int i = 0; i < input.length(); i++) { /* Cycle through each char in input */
		if (!isOperator(input[i]) && !isdigit(input[i]) && input[i] != '(' && input[i] != ')')
			return false;
	}
	return true;
}

/* Converts input (an infix string) to a postfix string and prints it */
void infixToPostfix(string rawInput, string input) {
	Stack stack; /* Our methods are void addToStack(char), char removeFromStack(), bool isEmpty(), void printStack() */
	string postfix = ""; /* Our eventual output, initialize to be blank */

	stack.addToStack('(');
	input += ')'; /* Add an end paren to our input string */

	/* Beginning our in to postfix algorithm */
	for (int i = 0, placement = 0; i < input.length(); i++, placement++) {
		char token = input[placement]; /*  The char to be evaluated */
		if (token == '(')
			stack.addToStack(token);
		else if (isdigit(token)) /* If token is a number, add to postfix statement */
			postfix += token;
		else if (token == ')') {
			while (!stack.isEmpty() && stack.peek() != '(') 
				postfix += stack.removeFromStack();
			stack.removeFromStack();
		}
		else { /* Token must be an operator */
			char topElem = stack.peek();
			while (!stack.isEmpty() && isOperator(topElem) && isHigherPrecedence(topElem, token)) {
				postfix += stack.removeFromStack();
				topElem = stack.peek();
			}
			stack.addToStack(token);
		}
	}

	/* Clear out our stack, adding all non-parenthesis values to output */
	while (!stack.isEmpty() && stack.peek() != '(')
		postfix += stack.removeFromStack();

	cout << "\n\nInfix Input.. " << rawInput << "\nPostfix Output.. " << postfix << "\n\n\n";
}