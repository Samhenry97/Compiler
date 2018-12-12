/*
 * File: Main.java
 * Author: Sam Henry 
 * Date: January 22, 2018
 * Class: CpS 450, Compiler
 * Desc: A Floyd language compiler
 */

package cps450.main;

import java.io.IOException;
import java.util.ArrayList;

import org.antlr.v4.gui.Trees;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ConsoleErrorListener;
import org.antlr.v4.runtime.tree.ParseTree;

import cps450.CodeGen;
import cps450.FloydLexerJr;
import cps450.FloydParser;
import cps450.SemanticChecker;
import cps450.SymbolTable;
import cps450.exceptions.FloydParserErrorListener;
import cps450.util.BitVersion;
import cps450.util.FileData;
import cps450.util.Options;
import cps450.util.Util;

public class Main {
	/**
	 * Generates the executable file from the generated
	 * assembly code. 
	 */
	public static void generateExecutable() {
		ArrayList<String> command = new ArrayList<>();
		command.add("gcc");
		if(Options.GCC_32BIT) { command.add("-m32"); }
		command.add(Util.getAssemblyFileName());
		if(Options.OUTPUT_64BIT) { command.add("stdlib64.o"); }
		else { command.add("stdlib.o"); }
		command.add("-o" + Util.getExecutableName());
		try {
			ProcessBuilder pb = new ProcessBuilder(command);
			Process p = pb.start();
    		if(p.waitFor() != 0) {
    			System.err.println("Error assembling code");
    			System.exit(1);
    		}
		} catch(IOException | InterruptedException e) {
			System.err.println("Error assembling code: " + e.getMessage());
			System.exit(1);
		}
	}
	
	/**
	 * Scans, parses, and compiles the given file data
	 * @param data the file contents as a string
	 */
    public static void compileFile(String data) {
    	// Perform Lexical Analysis
        CharStream input = CharStreams.fromString(data);
        FloydLexerJr lexer = new FloydLexerJr(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        
        // Perform Syntax Analysis
        FloydParser parser = new FloydParser(tokens);
        parser.removeErrorListener(ConsoleErrorListener.INSTANCE);
        parser.addErrorListener(new FloydParserErrorListener());
        ParseTree tree = parser.start();
        int error = parser.getNumberOfSyntaxErrors();
        
        SymbolTable sym = new SymbolTable();
        
        // Perform Semantic Analysis, handling errors
        if(error == 0) {
        	try {
        		SemanticChecker checker = new SemanticChecker(sym);
        		checker.visit(tree);
        		checker.checkStart();
        	} catch(Exception e) {
        		System.err.println("Error in semantic checking: " + e.getMessage());
        		System.exit(1);
        	}
        }
        
        // Display debug messages
        if(Options.DEBUG_PARSER) {
        	Trees.inspect(tree, parser);
        }
        
        System.out.println(error + " syntax error" + (error == 1 ? "" : "s"));
        System.out.println(Util.TOTAL_ERRORS + " error" + (Util.TOTAL_ERRORS == 1 ? "" : "s") + " found");
        
        // Now compile it!
        if(Util.TOTAL_ERRORS == 0) {
        	CodeGen gen = new CodeGen(sym);
        	gen.visit(tree);
        	gen.outputAssembly();
        	
        	if(!Options.DEBUG_ASSEMBLY) {
        		generateExecutable();
        	}
        }
    }

    /**
     * The entry point of the compiler
     * @param args The command-line arguments
     */
    public static void main(String[] args) {
    	Options.parseArgs(args);
    	BitVersion.init(); // 64/32-bit
    	String result = FileData.preprocessFiles();
    	compileFile(result);
    }
}
