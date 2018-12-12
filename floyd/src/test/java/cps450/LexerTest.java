/*
 * File: LexerTest.java
 * Author: Sam Henry 
 * Date: January 22, 2018
 * Class: CpS 450, Compiler
 * Desc: Unit Tests for the Floyd Lexer
 */

package cps450;

import static org.junit.Assert.assertTrue;

import java.io.IOException;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;
import org.junit.Test;

public class LexerTest {
	FloydLexer lexer;

	/**
	 * Runs tests to ensure the lexer is working correctly
	 * @throws IOException
	 */
	@Test
	public void testSuccessfulScan() throws IOException {
		CharStream input = CharStreams.fromStream(getClass().getResourceAsStream("test.floyd"));
		lexer = new FloydLexer(input);

		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.KW_CLASS, "class");
		assertNextToken(FloydLexer.IDENT, "Chicken");
		assertNextToken(FloydLexer.KW_IS, "is");
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.IDENT, "name");
		assertNextToken(FloydLexer.COLON);
		assertNextToken(FloydLexer.KW_STRING, "string");
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.IDENT, "_id2");
		assertNextToken(FloydLexer.COLON);
		assertNextToken(FloydLexer.KW_INT, "int");
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.IDENT, "eat");
		assertNextToken(FloydLexer.L_PAREN);
		assertNextToken(FloydLexer.R_PAREN);
		assertNextToken(FloydLexer.KW_IS, "is");
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.KW_BEGIN, "begin");
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.IDENT, "print");
		assertNextToken(FloydLexer.L_PAREN);
		assertNextToken(FloydLexer.STRING_LIT, "\"My name is \"");
		assertNextToken(FloydLexer.OP_CONCAT);
		assertNextToken(FloydLexer.IDENT, "name");
		assertNextToken(FloydLexer.OP_CONCAT);
		assertNextToken(FloydLexer.STRING_LIT, "\"! \\333\\r\\n\\t\\f\"");
		assertNextToken(FloydLexer.R_PAREN);
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.INT_LIT);
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.KW_END, "end");
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.KW_END, "end");
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.ERR_ILLEGAL_STRING, "\"\\w\"");
		assertNextToken(FloydLexer.NEWLINE);
		assertNextToken(FloydLexer.ERR_UNTERMINATED_STRING, "\"Oops");
		assertNextToken(FloydLexer.EOF);
	}

	// Verifies that the next token the lexer processes
	// is of type <type> and has the string value <value>
	private void assertNextToken(int type, String value) throws IOException {
		Token tok = lexer.nextToken();
		System.err.println(tok.getLine() + ":" + tok.getCharPositionInLine() + ":" + tok.getText());
		assertTrue(tok.getType() == type);
		assertTrue(tok.getText().equals(value));

	}

	// Verifies that the next token the lexer processes
	// is of the type <type>
	private void assertNextToken(int type) throws IOException {
		Token tok = lexer.nextToken();
		System.err.println(tok.getLine() + ":" + tok.getCharPositionInLine() + ":" + tok.getText());
		assertTrue(tok.getType() == type);
	}
}
