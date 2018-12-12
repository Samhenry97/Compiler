/*
 * File: MethodDecl.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The method declaration
 */

package cps450.declarations;

import java.util.ArrayList;

import cps450.Type;

public class MethodDecl extends Declaration {
	// The method name
	public String genName;
	public int offset = 0;
	
	// The arguments for the method
	public ArrayList<VarDecl> args = new ArrayList<>();
	
	// The locals for the method
	public ArrayList<VarDecl> locals = new ArrayList<>();
	
	/**
	 * Creates the method declaration
	 * @param type The method return type
	 */
	public MethodDecl(Type type) {
		super(type);
	}
	
	/**
	 * Creates the method declaration
	 * @param type The method return type
	 * @param className The class name
	 * @param name The method name
	 */
	public MethodDecl(Type type, String className, String name) {
		this(type, className, name, false);
	}
	
	/**
	 * Creates a method with the specific name (without _)
	 * @param type The method return type
	 * @param className The class name
	 * @param name The method name
	 * @param manual Whether or not to include "_"
	 */
	public MethodDecl(Type type, String className, String name, boolean manual) {
		super(type);
		this.name = name;
		if(manual) {
			this.genName = className + name;
		} else {
			this.genName = className + "_" + name;
		}
	}
	
	/**
	 * Determines if one method's signature equals
	 * another method's signature. Used for vtables
	 * @param other The other method to check
	 * @return True if they are equal
	 */
	public boolean equals(MethodDecl other) {
		if(!name.equals(other.name)) { return false; }
		if(!type.equals(other.type)) { return false; }
		if(args.size() != other.args.size()) { return false; }
		for(int i = 0; i < args.size(); i++) {
			if(!args.get(i).type.equals(other.args.get(i).type)) {
				return false;
			}
		}
		return true;
	}
}
