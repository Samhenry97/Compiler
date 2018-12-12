/*
 * File: TargetInsruction.java
 * Author: Sam Henry 
 * Date: March 1, 2018
 * Class: CpS 450, Compiler
 * Desc: Generic Intermediate Assembly Language
 */

package cps450.codegen;

public class TargetInstruction {
	public String comment = null; // A tentative comment
	
	/**
	 * The method is used for performing any normal
	 * operation to an emitted instruction
	 * @param text The text
	 * @return The formatted text
	 */
	public String getText(String text) {
		if(comment != null) {
			return String.format("%-26s %s", text.replaceAll("\\s*$", ""), "# " + comment.replaceAll("\\s*$", ""));
		} else {
			return text.replaceAll("\\s*$", "");
		}
	}
	
	/**
	 * The method is overridden by implementors of this
	 * interface. It returns the textual version of an 
	 * intermediate representation instruction to be
	 * outputted to the assembly
	 * @return The instruction text
	 */
	public String getText() {
		return "";
	}
	
	/**
	 * Sets the comment for the instruction
	 * @param comment The new comment
	 * @return This instance
	 */
	public TargetInstruction addComment(String comment) {
		this.comment = comment;
		return this;
	}
}
