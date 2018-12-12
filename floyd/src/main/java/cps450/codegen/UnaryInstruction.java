/*
 * File: UnaryInstruction.java
 * Author: Sam Henry 
 * Date: March 2, 2018
 * Class: CpS 450, Compiler
 * Desc: A unary instruction representation
 */

package cps450.codegen;

public class UnaryInstruction extends TargetInstruction {
	public String name;		// The instruction name
	public String left;		// The operand
	
	/**
	 * Creates the unary instruction with the name and operand
	 * @param name The name
	 * @param left The operand
	 */
	public UnaryInstruction(String name, String left) {
		this.name = name;
		this.left = left;
	}
	
	/**
	 * Gets the textual version of this instruction
	 * @return The text
	 */
	public String getText() {
		return getText(String.format("\t%-6s %-6s", name, left));
	}
}
