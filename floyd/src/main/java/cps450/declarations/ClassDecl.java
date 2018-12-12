/*
 * File: ClassDecl.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The class declaration
 */

package cps450.declarations;

import java.util.ArrayList;

import cps450.CodeGen;
import cps450.Type;
import cps450.util.Options;

import static cps450.util.BitVersion.*;

public class ClassDecl extends Declaration {
	public static String BASE_CLASS = "Oyd";
	public static int ID_GEN = 1;
	
	// A hashmap of the methods in the class for type checking
	private ArrayList<MethodDecl> methods = new ArrayList<>();
	private ArrayList<VarDecl> variables = new ArrayList<>();
	public ClassDecl inherit;
	public String stringLabel;
	public int id = ID_GEN++;
	public boolean genInit = true;

	/**
	 * Creates the class declaration with the given type
	 * @param type The type
	 */
	public ClassDecl(Type type) {
		super(type);
		name = type.name;
	}
	
	/**
	 * Adds a method to the class declaration with the given name
	 * @param name The method's name
	 * @param decl The method's declaration
	 */
	public void addMethod(MethodDecl decl) {
		for(int i = 0; i < methods.size(); i++) {
			MethodDecl methodDecl = methods.get(i);
			if(methodDecl.equals(decl)) {
				decl.offset = methodDecl.offset;
				methods.set(i, decl);
				return;
			}
		}
		decl.offset = methods.size() + 1;
		methods.add(decl);
	}
	
	/**
	 * Adds an inheritance level
	 * @param inherit The class inherited from
	 */
	public void addInherit(ClassDecl inherit) {
		this.inherit = inherit;
		methods.addAll(inherit.methods);
		variables.addAll(inherit.variables);
	}
	
	/**
	 * Generates the destroy method for this object (garbage collection)
	 * @param gen The code generator
	 */
	public void genDestroy(CodeGen gen) {
		gen.emitMethod(type.name + "destroy", 0);
		
		String destroy = "_destroy" + gen.destroylabel++;
		gen.emitBinary(MOV, OBJECT, EBX);
		gen.emitBinary(CMP, "$0", EBX);
		gen.emitUnary("je", destroy);
		gen.emitBinary(SUB, "$1", MEM(EBX, 1));
		gen.emitBinary(CMP, "$0", MEM(EBX, 1));
		gen.emitUnary("jg", destroy);
		gen.emitUnary(PUSH, EBX);
		
		for(VarDecl var : variables) {
			if(var.type.classType() || var.dim > 0) {
				String varDestroy = "_destroy" + gen.destroylabel++;
				gen.emitBinary(MOV, OBJECT, EBX);
				gen.emitBinary(MOV, MEM(EBX, var.offset), EBX);
				gen.emitBinary(CMP, "$0", EBX);
				gen.emitUnary("je", varDestroy);
				gen.emitUnary(PUSH, EBX);
				gen.emitBinary(MOV, MEM(EBX), EAX);
				gen.emitBinary(MOV, MEM(EAX, DESTROY_OFFSET), EBX);
				gen.emitUnary(CALL, VCALL);
				gen.addESP(1, true);
				gen.emitLabel(varDestroy);
			}
		}
		
		gen.emitUnary(POP, EAX);
		paramPush(EAX, 1);
		gen.emitUnary(CALL, "destroyobject");
		gen.addESP(1, false);
		gen.emitLabel(destroy);
		
		gen.emitMethodClose();
	}
	
	/**
	 * This method is the runtime type information for an object
	 * @param gen The code generator
	 */
	public void genType(CodeGen gen) {
		gen.emitMethod(type.name + "_type", 0);
		
		gen.emitBinary(MOV, OBJECT, EBX);
		gen.emitBinary(MOV, MEM(EBX), EAX);
		
		gen.emitMethodClose();
	}
	
	/**
	 * Generates the vtable into the instruction set for a class
	 * @param gen The code generator
	 */
	public void genVTable(CodeGen gen) {
		String name = type.name + "vtable";
		String size = Options.OUTPUT_64BIT ? ".quad" : ".long";
		gen.emitUnary(".weak", name);
		if(Options.OUTPUT_64BIT) {
			gen.emitUnary(".section", String.format(".gnu.linkonce.r.%s,\"aG\",@progbits,%s,comdat", name, name));
		} else {
			gen.emitUnary(".section", String.format(".gnu.linkonce.r.%s,\"a\",@progbits", name));
		}
		gen.emitUnary(".align", "8");
		gen.emitBinary(".type", name, "@object");
		gen.emitBinary(".size", name, String.valueOf(methods.size() * SIZE));
		gen.emitLabel(name);
		gen.emitUnary(size, inherit == null ? "0" : inherit.type.name + "vtable");
		for(int i = 0; i < methods.size(); i++) {
			gen.emitUnary(size, methods.get(i).genName);
		}
        gen.emit();
	}
	
	/**
	 * Generates the name accessor for the class
	 * This is used for inheritance/type checking
	 * @param gen The code generator
	 */
	public void genName(CodeGen gen) {
		gen.emitMethod(type.name + "name", 0);
		gen.emitBinary(MOV, "$" + stringLabel, EAX);		
		gen.emitMethodClose();
	}
	
	/**
	 * Gets the method with the name specified
	 * @param methodName The name to look for
	 * @return The method, or null if not found
	 */
	public MethodDecl getMethod(String methodName) {
		for(int i = methods.size() - 1; i >= 0; i--) {
			MethodDecl decl = methods.get(i);
			if(decl.name.equals(methodName)) {
				return decl;
			}
		}
		return null;
	}
	
	/**
	 * Adds the variable declaration to the class
	 * @param decl The variable declaration
	 */
	public void addVar(VarDecl decl) {
		decl.offset = 4 + getSize();
		variables.add(decl);
	}
	
	/**
	 * Gets the memory size of a class
	 * @return The memory footprint of a class
	 */
	public int getSize() {
		return variables.size();
	}
	
	/**
	 * Emits code to initialize class variables
	 * @param gen The code generator
	 */
	public void init(CodeGen gen) {
		if(genInit) { gen.emitUnary("call", type.name + "init"); }
		if(inherit != null) { inherit.init(gen); }
	}
	
	/**
	 * Emits code to destroy class variables
	 * @param gen The code generator
	 */
	public void destroy(CodeGen gen) {
		gen.emitUnary("call", type.name + "destroy");
		if(inherit != null) { inherit.destroy(gen); }
	}
	
	/**
	 * Checks whether an assignment or parameter passing is valid
	 * @param other The other type
	 * @return True if valid type
	 */
	public boolean validType(Type other) {
		if(type.equals(other)) {
			return true;
		} else if(inherit != null) {
			return inherit.validType(other);
		}
		return false;
	}
}
