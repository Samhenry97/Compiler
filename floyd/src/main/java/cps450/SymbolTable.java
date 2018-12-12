/*
 * File: SymbolTable.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The symbol table for the compiler
 */

package cps450;

import java.util.ArrayList;
import java.util.HashMap;

import cps450.declarations.Declaration;
import cps450.exceptions.InvalidScopeException;

public class SymbolTable {
	public static int GLOBAL_SCOPE = 0;
	public static int CLASS_SCOPE = 1;
	public static int LOCAL_SCOPE = 2;
	
	// The table itself. One hashmap per scope level.
	private ArrayList<HashMap<String, Symbol>> table = new ArrayList<>();
	
	// The current scope
	private int scope = 0;
	
	// The last class added
	public Symbol lastClass = null;
	
	/**
	 * Constructs the symbol table, adding a hashmap
	 * for the first scope level.
	 */
	public SymbolTable() {
		table.add(new HashMap<>()); // For first scope
	}
	
	/**
	 * Creates, adds, and returns a symbol
	 * to the symbol table 
	 * @param name The symbol's name
	 * @param decl The symbol's declaration
	 * @return The created symbol
	 */
	public Symbol push(String name, Declaration decl) {
		Symbol symbol = new Symbol(name, decl, scope);
		if(scope == 0) { lastClass = symbol; }
		table.get(scope).put(name, symbol);
		return symbol;
	}
	
	/**
	 * Searches for a symbol, returning null if not found
	 * @param name The symbol to search for
	 * @return The symbol, or null if not found
	 */
	public Symbol lookup(String name) {
		for(int i = table.size() - 1; i >= 0; i--) {
			if(table.get(i).containsKey(name)) {
				return table.get(i).get(name);
			}
		}
		
		return null;
	}
	
	/**
	 * Increments the scope level, and adds
	 * a hashmap for any new scope level
	 */
	public void beginScope() {
		scope++;
		if(scope >= table.size()) { table.add(new HashMap<>()); }
	}
	
	/**
	 * Ends the scope level, clearing the current scope level
	 */
	public void endScope() {
		if(scope == 0) { throw new InvalidScopeException(); }
		
		table.get(scope).clear();		
		scope--;
	}
	
	/**
	 * Gets the current scope level
	 * @return The current scope level
	 */
	public int getScope() {
		return scope;
	}
}
