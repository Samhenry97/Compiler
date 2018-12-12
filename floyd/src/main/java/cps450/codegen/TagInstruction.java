/*
 * File: TagInstruction.java
 * Author: Sam Henry 
 * Date: March 2, 2018
 * Class: CpS 450, Compiler
 * Desc: A tag instruction representation
 */

package cps450.codegen;

public class TagInstruction extends TargetInstruction {
	String section;	// The section
	String name;	// The name
	
	/**
	 * Creates the instruction with just a section
	 * @param section The section
	 */
	public TagInstruction(String section) {
		this.section = section;
		this.name = null;
	}
	
	/**
	 * Creates the instruction
	 * @param section The section
	 * @param name The name of the section
	 */
	public TagInstruction(String section, String name) {
		this.section = section;
		this.name = name;
	}
	
	/**
	 * Gets the textual version of the instruction
	 * @return The text
	 */
	public String getText() {
		if(name != null) {
			return getText(String.format("%s %s", section, name));
		} else {
			return getText(section);
		}
	}

}
