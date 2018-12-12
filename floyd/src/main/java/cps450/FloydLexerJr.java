/*
 * File: FloydLexerJr.java
 * Author: Sam Henry 
 * Date: February 2, 2018
 * Class: CpS 450, Compiler
 * Desc: Helper methods for the lexer
 */

package cps450;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;

import cps450.FloydLexer;
import cps450.util.FileData;
import cps450.util.Options;
import cps450.util.Util;

public class FloydLexerJr extends FloydLexer {	
	/**
	 * Creates the lexer
	 * @param input The character strem to parse
	 */
	public FloydLexerJr(CharStream input) {
		super(input);
	}
	
	/**
	 * Gets a string representation of the token, including
	 * file, line, and character position
	 * @param token The token to inspect
	 * @return The string representation
	 */
	public String getTokenMetadata(Token token) {
		FileData file = FileData.getFileNameFromLine(token.getLine());
		int lineInFile = file.lines - (file.lineEnding - token.getLine());
		StringBuilder output = new StringBuilder(
			String.format("%s:%d,%d", file.name, lineInFile, token.getCharPositionInLine() + 1));
        String type = Util.getTypeStringFromToken(token);
        String display = Util.getDisplayStringFromToken(token);

        if(type != null) { output.append(":" + type); }
        if(display != null) { output.append(":" + display); }
        
        return output.toString();
	}
	
	/**
	 * Gets the next token for the parser,
	 * removing any error tokens from the stream
	 * @return The next token from the CharStream
	 */
	@Override
	public Token nextToken() {
		Token token = null;
		
		// Eat all the error tokens; don't send to parser
		while(Util.isErrorToken(token = super.nextToken())) {
			System.err.println(getTokenMetadata(token));
			Util.TOTAL_ERRORS++;
		}
		
		if(Options.DEBUG_LEXER && token.getType() != FloydLexer.EOF) {
			System.out.println(getTokenMetadata(token));
		}
        
		return token;
	}
}
