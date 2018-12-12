/*
 * File: SymbolTableTest.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: Unit Tests for the SymbolTable
 */

package cps450;

import static org.junit.Assert.assertTrue;

import cps450.Symbol;
import cps450.SymbolTable;
import cps450.Type;
import cps450.declarations.ClassDecl;
import cps450.declarations.MethodDecl;
import cps450.declarations.VarDecl;
import org.junit.Test;

public class SymbolTableTest {
	/**
	 * Runs tests to ensure the symbol table
	 * is working correctly
	 */
	@Test
	public void testSymbolTable() {
		SymbolTable table = new SymbolTable();
		
    	Symbol x = table.push("x", new VarDecl(Type.INT));
    	assertTrue(x.name == "x");
    	assertTrue(x.decl instanceof VarDecl && x.decl.type == Type.INT);
    	assertTrue(table.lookup("x").scope == 0);
    	
    	table.beginScope();
    	
    	Symbol y = table.push("y", new MethodDecl(Type.BOOL));
    	assertTrue(y.name == "y");
    	assertTrue(y.decl instanceof MethodDecl && y.decl.type == Type.BOOL);
    	assertTrue(table.lookup("y").scope == 1);
    	assertTrue(table.lookup("x").scope == 0);
    	
    	table.beginScope();
    	
    	Symbol z = table.push("x", new ClassDecl(Type.ERROR));
    	assertTrue(z.name == "x");
    	assertTrue(z.decl instanceof ClassDecl && z.decl.type == Type.ERROR);
    	assertTrue(table.lookup("x").scope == 2);
    	assertTrue(table.lookup("y").scope == 1);
    	
    	table.endScope();
    	assertTrue(table.lookup("x").scope == 0);
    	
    	table.endScope();
    	assertTrue(table.lookup("y") == null);
    	assertTrue(table.lookup("x").scope == 0);
	}
}