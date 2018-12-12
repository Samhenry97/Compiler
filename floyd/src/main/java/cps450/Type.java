/*
 * File: Type.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The type data for semantic analysis
 */

package cps450;

import java.util.HashMap;

import cps450.declarations.ClassDecl;

public class Type {
	//*********************************************************
	// Static Data
	//*********************************************************
	
	public static HashMap<String, Type> types = new HashMap<>();
	
	public static Type ERROR = new Type("<error>");	// For semantic errors
	public static Type INT = new Type("int");		// For integer types
	public static Type BOOL = new Type("boolean");	// For boolean types
	public static Type STRING = new Type("String");	// For string types
	public static Type VOID = new Type("void");		// For types with no return
	public static Type NULL = new Type("null");		// For null types
	
	/**
	 * This method initializes the type table for easy
	 * lookup for the semantic checker
	 */
	public static void init() {
		types.put("int", INT);
		types.put("boolean", BOOL);
		types.put("String", STRING);
	}

	/**
	 * Gets the type associated with the given name
	 * @param name
	 * @return The type, or null if not found
	 */
	public static Type get(String name) {
		return types.get(name);
	}
	
	/**
	 * Adds a type with the given name to the table
	 * @param name The new type to add
	 */
	public static Type add(String name) {
		Type newType = new Type(name);
		types.put(name, newType);
		return newType;
	}
	
	/**
	 * Gets the available types
	 * @return The available types
	 */
	public static HashMap<String, Type> getTypes() {
		return types;
	}
	
	//*********************************************************
	// Class Data
	//*********************************************************
	
	// The name of the type
	public String name;
	public ClassDecl decl;
	
	/**
	 * Constructs a type with the given name
	 * @param name The name of the type
	 */
	public Type(String name) {
		this(name, null);
	}
	
	/**
	 * Creates a type with the given name and class declaration
	 * @param name The name of the type
	 * @param decl The class declaration
	 */
	public Type(String name, ClassDecl decl) {
		this.name = name;
		this.decl = decl;
	}
	
	/**
	 * Generates the name of a type with the given dimension
	 * @param dim The dimension
	 * @return The name
	 */
	public String name(int dim) {
		if(dim < 0) { dim = 0; }
		return name + new String(new char[dim]).replace("\0", "[]");
	}
	
	/**
	 * Determines if the types are equal or not. Compares
	 * using the name representations. If either type is an 
	 * error, returns true so no more semantic errors happen
	 * @param other The other type to compare to
	 * @param dimLeft dimension of left type
	 * @param dimRight dimension of right type
	 * @return Whether or not the types are equal
	 */
	public boolean eq(Type other, int dimLeft, int dimRight) {
		if(equals(Type.ERROR) || other.equals(Type.ERROR)) { return true; }
		if(classType() && other.classType() && (equals(Type.NULL) || other.equals(Type.NULL))) { return true; }
		if(dimLeft != dimRight) { return false; }
		else if(decl != null && other.decl != null) {
			return decl.validType(other) || other.decl.validType(this);
		}
		return equals(other);
	}
	
	/**
	 * Is the type a class type?
	 * @return True if a class type
	 */
	public boolean classType() {
		return (!equals(Type.BOOL) && !equals(Type.INT) && !equals(Type.VOID));
	}
}
