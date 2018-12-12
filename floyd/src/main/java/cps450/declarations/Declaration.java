/*
 * File: Declaration.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The generic declaration class
 */

package cps450.declarations;

import cps450.Type;

public class Declaration {
	public Type type; 			// The type
	public int dim = 0;			// The array dimension (for methods/vars)
	public String name = ""; 	// The name
	
	/**
	 * Creates the declaration
	 * @param type The type of the declaration
	 */
	public Declaration(Type type) {
		this.type = type;
	}
}