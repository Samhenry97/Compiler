/*
 * File: FloydParserErrorListener.java
 * Author: Sam Henry 
 * Date: February 2, 2018
 * Class: CpS 450, Compiler
 * Desc: Custom error handler for Floyd Parser
 */

package cps450.exceptions;

import org.antlr.v4.runtime.ConsoleErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

import cps450.util.FileData;
import cps450.util.Options;
import cps450.util.Util;

public class FloydParserErrorListener extends ConsoleErrorListener {
	/**
	 * Called when a syntax error from the grammar happens -
	 * prints file name, line number, and character position.
	 * Also displays stack trace if necessary.
	 */
	@Override
	public void syntaxError(Recognizer<?, ?> recognizer, 
							Object offendingSymbol, 
							int line, 
							int charPositionInLine, 
							String msg, 
							RecognitionException e) {
		FileData file = FileData.getFileNameFromLine(line);
		int lineInFile = file.lines - (file.lineEnding - line);
		System.err.println(String.format("%s:%d,%d:%s", file.name, lineInFile, charPositionInLine, msg));
		if (Options.DEBUG_PARSER && e != null) { e.printStackTrace(); }
		Util.TOTAL_ERRORS++;
	}
}