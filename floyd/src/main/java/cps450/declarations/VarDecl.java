/*
 * File: VarDecl.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The variale declaration
 */

package cps450.declarations;

import cps450.Type;

public class VarDecl extends Declaration {
	public int offset;
	
	/**
	 * Creates the varaible declaration with the given type
	 * @param type The variable's type
	 */
	public VarDecl(Type type) {
		super(type);
	}
	
	/**
	 * Creates the variable declaration with the given type
	 * @param type The variable's type
	 * @param offset The variable's offset (for assembly)
	 */
	public VarDecl(Type type, int offset) {
		super(type);
		this.offset = offset;
	}
	
	/**
	 * Creates the variable declaration with the given type and name
	 * @param type The variable's type
	 * @param name The variable's name
	 */
	public VarDecl(Type type, String name) {
		super(type);
		this.name = name;
	}
}
