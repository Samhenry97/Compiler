/*
 * File: Util.java
 * Author: Sam Henry 
 * Date: January 22, 2018
 * Class: CpS 450, Compiler
 * Desc: Utility functions for the lexer
 */

package cps450.util;

import org.antlr.v4.runtime.Token;

import cps450.FloydLexer;

public class Util {	
	// Total lexer and parser errors
	public static int TOTAL_ERRORS = 0;
	
	/**
	 * Given a token, this method returns a string
	 * representing the type or "class" of that token
	 * @param token The token to process
	 * @return A description string, or null
	 */
    public static String getTypeStringFromToken(Token token) {
        int type = token.getType();

        switch(type) {
            case FloydLexer.NEWLINE: return "cr";
            case FloydLexer.IDENT: return "identifier";
            case FloydLexer.STRING_LIT: return "string lit";
            case FloydLexer.INT_LIT: return "integer lit";
            case FloydLexer.ERR_UNRECOGNIZED: return "Unrecognized char";
            case FloydLexer.ERR_ILLEGAL_STRING: return "Illegal string";
            case FloydLexer.ERR_UNTERMINATED_STRING: return "Unterminated string";
            default: 
                if(FloydLexer.KW_AND <= type && type <= FloydLexer.KW_WHILE) {
                    return "keyword";
                } else if(FloydLexer.OP_CONCAT <= type && type <= FloydLexer.OP_EQ) {
                    return "operator";
                } else {
                    return null;
                }
        }
    }

    /**
     * Given a token, this method returns a string
     * with the formatted content of that token
     * @param token The token to process
     * @return The formatted text, or null
     */
    public static String getDisplayStringFromToken(Token token) {
        int type = token.getType();
        String text = token.getText();

        switch(type) {
            case FloydLexer.NEWLINE: return null;
            case FloydLexer.IDENT:
            case FloydLexer.STRING_LIT:
            case FloydLexer.INT_LIT:
            case FloydLexer.ERR_ILLEGAL_STRING:
            case FloydLexer.ERR_UNTERMINATED_STRING: return text;
            case FloydLexer.ERR_UNRECOGNIZED: return " " + text;
            default: 
                if(FloydLexer.KW_AND <= type && type <= FloydLexer.KW_WHILE) {
                    return text;
                } else {
                    return "'" + text + "'";
                }
        }
    }
    
    /**
     * Given a token, decide if it is an error token or not
     * @param token The token to check
     * @return Whether or not the token is an error
     */
    public static boolean isErrorToken(Token token) {
    	if(token == null) { return true; }
    	int type = token.getType();
    	return type == FloydLexer.ERR_UNRECOGNIZED ||
    		   type == FloydLexer.ERR_ILLEGAL_STRING ||
    		   type == FloydLexer.ERR_UNTERMINATED_STRING;
    }
    
    /**
     * Gets the file name of the program
     * @return The file name
     */
    public static String getFileName() {
    	return Options.fileNames.get(Options.fileNames.size() - 1);
    }
    
    /**
     * Returns the assembly file name to generate
     * @return The assembly file
     */
    public static String getAssemblyFileName() {
    	if(Options.OUT_FILE != null) {
    		return Options.OUT_FILE + ".s";
    	} else {
    		String fileName = getFileName();
    		return fileName.replaceAll(".floyd", ".s");
    	}
    }
    
    /**
     * Gets the name of the executable 
     * @return The file name of the executable
     */
    public static String getExecutableName() {
    	if(Options.OUT_FILE != null) {
    		return Options.OUT_FILE;
    	} else {
    		String fileName = getFileName();
        	return fileName.replaceAll(".floyd", "");
    	}
    }
    
}