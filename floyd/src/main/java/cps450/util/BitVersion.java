/*
 * File: Const.java
 * Author: Sam Henry 
 * Date: April 4, 2018
 * Class: CpS 450, Compiler
 * Desc: Holds the 64/32-bit constants
 */

package cps450.util;

import cps450.CodeGen;

public class BitVersion {
	public static int PARAM_IDX = 0;
	public static String LAST_REG = "";
	public static String[] PARAM_64 = { "%rdi", "%rsi", "%rdx", "%rcx", "%r8", "%r9" };
	public static CodeGen gen;
	
	/**
	 * Performs the correct push
	 * @param val The value to push
	 */
	public static void paramPush(String val) {
		paramPush(val, PARAM_IDX);
	}
	
	/**
	 * Performs the correct push
	 * @param val The value to push
	 * @param curIdx The number of values to come
	 */
	public static void paramPush(String val, int curIdx) {
		PARAM_IDX = curIdx - 1;
		if(PARAM_IDX >= 0 && Options.OUTPUT_64BIT && PARAM_IDX < PARAM_64.length) {
			LAST_REG = PARAM_64[PARAM_IDX];
			gen.emitBinary(MOV, val, LAST_REG);
		} else {
			LAST_REG = MEM(ESP);
			gen.emitUnary(PUSH, val);
		}
	}
	
	/**
	 * Gets the memory location of a register or variable
	 * @param reg The register/variable
	 * @return The code for memory access
	 */
	public static String MEM(String reg) {
		return String.format("(%s)", reg);
	}
	
	/**
	 * Gets the memory location of a register or variable
	 * @param reg The register/variable
	 * @param offset The offset
	 * @return The code for memory access
	 */
	public static String MEM(String reg, int offset) {
		return String.format("%d(%s)", SIZE * offset, reg);
	}
	
	// Pre-defined functions for every class
	// These will be the first three of all vtables
	public static int DESTROY_OFFSET = 1;
	public static int NAME_OFFSET = 2;
	public static int SIZE = 4;
	
	// Variables for easier use of names
	public static String OBJECT = "8(%ebp)";
	public static String RET = "-4(%ebp)";
	public static String PUSH = "pushl";
	public static String POP = "popl";
	public static String CALL = "call";
	public static String EAX = "%eax";
	public static String EBX = "%ebx";
	public static String ECX = "%ecx";
	public static String EDX = "%edx";
	public static String EBP = "%ebp";
	public static String ESP = "%esp";
	public static String MOV = "movl";
	public static String ZMOV = "movzbl";
	public static String ADD = "addl";
	public static String SUB = "subl";
	public static String CMP = "cmpl";
	public static String MUL = "imull";
	public static String DIV = "idivl";
	public static String XOR = "xorl";
	public static String NEG = "negl";
	public static String OR = "orl";
	public static String AND = "andl";
	public static String VCALL = "*" + EBX;
	
	/**
	 * Initializes the constants with the correct
	 * 64/32-bit names 
	 */
	public static void init() {
		if(Options.OUTPUT_64BIT) {
			SIZE = 8;
			
			OBJECT = "16(%rbp)";
			RET = "-8(%rbp)";
			PUSH = "pushq";
			POP = "popq";
			EAX = "%rax";
			EBX = "%rbx";
			ECX = "%rcx";
			EDX = "%rdx";
			EBP = "%rbp";
			ESP = "%rsp";
			MOV = "movq";
			ZMOV = "movzbq";
			ADD = "addq";
			SUB = "subq";
			CMP = "cmpq";
			MUL = "imulq";
			DIV = "idivq";
			XOR = "xorq";
			NEG = "negq";
			OR = "orq";
			AND = "andq";
			VCALL = "*" + EBX;
		}
	}

}
