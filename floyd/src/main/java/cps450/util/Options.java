/*
 * File: Options.java
 * Author: Sam Henry 
 * Date: January 22, 2018
 * Class: CpS 450, Compiler
 * Desc: Command-Line options for the lexer
 */

package cps450.util;

import java.util.ArrayList;

public class Options {
	// The list of file names passed in from command line
	public static ArrayList<String> fileNames = new ArrayList<>();
	static { fileNames.add("stdlib.floyd"); }
	
    // Whether or not the lexer should print all tokens
    // and descriptions to stdout
    public static boolean DEBUG_LEXER = false;
    
    // Whether or not to display stack trace for exceptions
    // and a graphical parse tree
    public static boolean DEBUG_PARSER = false;
    
    // Whether or not to actually compile the
    // generated assembly file
    public static boolean DEBUG_ASSEMBLY = false;
    
    // Whether or not to execute gcc with the
    // 32-bit flag for 64-bit systems
    public static boolean GCC_32BIT = false;
    
    // Whether or not to output 64-bit assembly
    public static boolean OUTPUT_64BIT = false;
    
    // The output file for gcc to generate
    public static String OUT_FILE = null;
    
    // Whether or not to optimize
    public static boolean OPTIMIZE = true;
    
    // Whether or not to include garbage collection.
    public static boolean GARBAGE_COLLECTION = true;
    
    // Whether or not to perform inheritance checks
    public static boolean CHECK_INHERITANCE = true;
    
    // Whether or not to perform null checks
    public static boolean NULL_CHECKS = true;
    
    /**
     * Handles the command line arguments for the compiler
     * Supported options:
     * 		-ds: Debug Lexer
     * 		-dp: Debug Parser
     * 		-g:  Output Debug Directives
     * 		-S:  Only output assembly; Dont' invoke gcc
     * 		-o:  Output executable has following name
     * 		-m:	 Execute gcc with a 32-bit flag
     * @param args The command line arguments
     */
    public static void parseArgs(String args[]) {
    	if(args.length <= 0) {
            System.out.println("usage:\n  parser [-ds] [-dp] <filename>");
            System.exit(1);
        }
    	
    	for(String arg : args) {
    		switch(arg) {
	    		case "-ds": DEBUG_LEXER = true; break;
	    		case "-dp": DEBUG_PARSER = true; break;
	    		case "-S": DEBUG_ASSEMBLY = true; break;
	    		case "-m": GCC_32BIT = true; break;
	    		case "-64": OUTPUT_64BIT = true; break;
	    		case "-ooff": OPTIMIZE = false; break;
	    		case "-goff": GARBAGE_COLLECTION = false; break;
	    		case "-ioff": CHECK_INHERITANCE = false; break;
	    		case "-noff": NULL_CHECKS = false; break;
	    		default: 
	    			if(arg.startsWith("-o")) {
	    				OUT_FILE = arg.substring(2);
	    			} else {
	    				fileNames.add(arg);
	    			} 
    		}
        }
    }
}