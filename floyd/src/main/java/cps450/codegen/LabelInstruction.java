/*
 * File: LabelInstruction.java
 * Author: Sam Henry 
 * Date: March 2, 2018
 * Class: CpS 450, Compiler
 * Desc: A label instruction representation
 */

package cps450.codegen;

public class LabelInstruction extends TargetInstruction {
	private String label; // The label name

	/**
	 * Constructs the label instruction
	 * @param label The label name
	 */
	public LabelInstruction(String label) {
		this.label = label;
	}
	
	/**
	 * Gets the textual representation of the instruction
	 * @return The text
	 */
	public String getText() {
		return getText(label + ":");
	}
}
