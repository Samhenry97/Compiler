/*
 * File: BinaryInstruction.java
 * Author: Sam Henry 
 * Date: March 2, 2018
 * Class: CpS 450, Compiler
 * Desc: The class for binary instruction representation
 */

package cps450.codegen;

public class BinaryInstruction extends TargetInstruction {
	public String name;		// The name
	public String left;		// The left operand
	public String right;	// The right operand

	/**
	 * Constructs the binary instruction
	 * @param name The instruction name
	 * @param left The left operand
	 * @param right The right operand
	 */
	public BinaryInstruction(String name, String left, String right) {
		this.name = name;
		this.left = left;
		this.right = right;
	}
	
	/**
	 * Gets the textual version of the instruction
	 * @return The text
	 */
	public String getText() {
		return getText(String.format("\t%-6s %-6s %-6s", name, left + ",", right));
	}
}
