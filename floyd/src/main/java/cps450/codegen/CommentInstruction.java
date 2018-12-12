/*
 * File: CommentInstruction.java
 * Author: Sam Henry 
 * Date: March 2, 2018
 * Class: CpS 450, Compiler
 * Desc: A comment instruction representation
 */

package cps450.codegen;

public class CommentInstruction extends TargetInstruction {
	String comment; // The comment

	/**
	 * Constructs a comment instruction
	 * @param comment The comment
	 */
	public CommentInstruction(String comment) {
		this.comment = comment;
	}
	
	/**
	 * Gets the textual version of the instruction
	 * @return The text
	 */
	public String getText() {
		return getText("\t# " + comment);
	}
}
