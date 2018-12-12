/*
 * File: Symbol.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The symbol for the symbol table
 */

package cps450;

import cps450.declarations.Declaration;

public class Symbol {
	public int scope;		// The scope of the symbol
	public String name;		// The symbol name
	public Declaration decl;// The associated declaration

	/**
	 * Create the symbol with the given name, declration, and scope
	 * @param name The symbol's name
	 * @param decl The symbol's declaraction (variable, method, class, etc)
	 * @param scope The symbol's scope
	 */
	public Symbol(String name, Declaration decl, int scope) {
		this.name = name;
		this.scope = scope;
		this.decl = decl;
	}
}
