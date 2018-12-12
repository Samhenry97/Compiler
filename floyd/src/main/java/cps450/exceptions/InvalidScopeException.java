/*
 * File: InvalidScopeException.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: An exception class for invalid scope exceptions
 */

package cps450.exceptions;

@SuppressWarnings("serial")
public class InvalidScopeException extends RuntimeException {
	
	/**
	 * The message for the invalid scope exception
	 * @return The message
	 */
	@Override
	public String getMessage() {
		return "Scope out of bounds during semantic checks";
	}
}
