/*
 * File: SemanticError.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The generic semantic error handler
 */

package cps450.exceptions;

import org.antlr.v4.runtime.Token;

import cps450.util.FileData;
import cps450.util.Util;

public class SemanticError {
	// The token where the error occurred -
	// used for getting line and character position
	protected Token tok;
	
	/**
	 * Constructs a semantic error
	 * @param tok The error token
	 */
	public SemanticError(Token tok) {
		this.tok = tok;
		Util.TOTAL_ERRORS++;
	}
	
	/**
	 * Gets the basic string for the compiler
	 * to output an error - includes filename,
	 * line, and character position
	 * @return The error message
	 */
	public String getMessage() {
		if(tok != null) {
			int line = tok.getLine();
			FileData file = FileData.getFileNameFromLine(line);
			int lineInFile = file.lines - (file.lineEnding - line);
			return String.format("%s:%d,%d: ", file.name, lineInFile, tok.getCharPositionInLine());
		} else {
			return Util.getFileName() + ": ";
		}
	}
	
	/**
	 * The generic error message - prints the message to stderr
	 * @param message The message
	 */
	public void error(String message) {
		System.err.println(getMessage() + message);
	}
	
	/**
	 * An unsupported feature in the Floyd compiler
	 * @param feature The feature
	 */
	public void unsupported(String feature) {
		error(String.format("Unsupported Feature: %s", feature));
	}
	
	/**
	 * Redeclaration of variable error
	 * @param type method/class/variable
	 */
	public void redeclaration(String type) {
		error(String.format("Redeclaration of %s: \"%s\"", type, tok.getText()));
	}
	
	/**
	 * Use of undefined variable error
	 * @param type method/class/variable
	 */
	public void undefined(String type) {
		error(String.format("Use of undeclared %s: \"%s\"", type, tok.getText()));
	}
	
	/**
	 * Incorrect parameter count for method error
	 * @param rec The parameters given
	 * @param act The parameters expected
	 */
	public void parameterCount(int rec, int act) {
		error(String.format("Expected %d parameters in call to %s(); received %d", act, tok.getText(), rec));
	}
	
	/**
	 * Incorrect parameter type for method error
	 * @param method The method name
	 * @param expected The expected parameter type
	 * @param actual The received parameter type
	 * @param pos The index of the parameter
	 */
	public void parameterType(String method, String expected, String actual, int pos) {
		error(String.format("Parameter type mismatch in parameter %d of %s(); expected %s, got %s", pos, method, expected, actual));
	}
	
	/**
	 * A generic type error for unary operators
	 * @param op The operator where the error occurred
	 * @param expect The expected type
	 * @param left The received type
	 */
	public void typeError(String op, String expect, String left) {
		error(String.format("Incorrect type for %s: requires %s, given %s", op, expect, left));
	}
	
	/**
	 * A generic type error for binary operators
	 * @param op The operator where the error occurred
	 * @param expect The expected type
	 * @param left The type on the left
	 * @param right The type on the right
	 */
	public void typeError(String op, String expect, String left, String right) {
		error(String.format("Incorrect type for %s: requires %s, given %s and %s", op, expect, left, right));
	}
}
