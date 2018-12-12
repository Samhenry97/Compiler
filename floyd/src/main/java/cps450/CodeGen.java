/*
 * File: CodeGen.java
 * Author: Sam Henry 
 * Date: March 2, 2018
 * Class: CpS 450, Compiler
 * Desc: The code generator
 */

package cps450;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;

import cps450.FloydParser.*;
import cps450.codegen.*;
import cps450.declarations.*;
import cps450.util.*;

import static cps450.util.BitVersion.*;

public class CodeGen extends FloydBaseVisitor<Void> {
	//*************************************************************
	// General CodeGen Declaration
	//*************************************************************
	
	// The target instructions
	public ArrayList<TargetInstruction> target = new ArrayList<>();
	
	// File name to the emitted string in the assembly code
	public HashMap<String, String> files = new HashMap<>();
	public SymbolTable sym;
	public int iflabel = 0;			// If statements
	public int looplabel = 0;		// Loop statements
	public int stringlabel = 0;		// String literals
	public int destroylabel = 0;	// Destroys and null checks
	public int nulllabel = 0;		// Null checks
	
	/**
	 * Constructs the code generator. Emits any
	 * instructions that should always be emitted
	 */
	public CodeGen(SymbolTable sym) {	
		this.sym = sym;
		BitVersion.gen = this;
		
		emitComment("Global variables", false);
		emitTag(".data");
		emitBinary(".comm", "_in", String.format("%d,%d", SIZE, SIZE));		// Predefined reader (in)
		emitBinary(".comm", "_out", String.format("%d,%d", SIZE, SIZE));	// Predefined writer (out)
		emit();
		
		// Emit all of the predefined strings here
		emitUnary(".section", ".rodata");
		
		files.put("unknown", emitString("\"unknown\"", false));
		for(String file : Options.fileNames) {
			files.put(file, emitString(String.format("\"%s\"", file), false));
		}
		
		for(Entry<String, Type> entry : Type.getTypes().entrySet()) {
			Type type = entry.getValue();
			if(type.classType()) {
				String label = emitString(String.format("\"%s\"", entry.getKey()), false);
				entry.getValue().decl.stringLabel = label;
			}
		}
			
		emit();
		emitTag(".text");
	}
	
	//*************************************************************
	// Instruction Generator Helpers (emit*)
	//*************************************************************
	
	/**
	 * Emits the necessary instructions for a method header
	 * @param name The method name
	 */
	public void emitMethod(String name, int stackSpace) {
		emitTag(".global", name);
		emitBinary(".type", name, "@function");
		emitLabel(name);
		emitUnary(PUSH, EBP);
		emitBinary(MOV, ESP, EBP);
		emitBinary(SUB, "$" + (stackSpace * SIZE), ESP);
	}
	
	/**
	 * Emits the necessary instruction to return from a method
	 */
	public void emitMethodClose() {
		emitUnary("leave", "");
		emitUnary("ret", "");
		emit();
	}
	
	/**
	 * Creates the necessary code for a string
	 * @param text The string
	 * @return The label that was generated
	 */
	public String emitString(String text, boolean header) {
		String label = ".stringlit" + stringlabel++;
		if(header) { emitUnary(".section", ".rodata"); }
		emitLabel(label);
		emitUnary(".string", text);
		if(header) { emitTag(".text"); }
		return label;
	}
	
	/**
	 * Emits the code to push an identifier associated
	 * with a symbol on the stack
	 * @param sym The identifier's symbol
	 * @param text The text for the identifier
	 */
	public void emitIdentifier(Symbol sym, String text) {
		if(sym.decl instanceof ClassDecl) {
			emitUnary(PUSH, String.format("$%svtable", sym.decl.type.name));
		} else if(sym.scope == SymbolTable.LOCAL_SCOPE) {
			int offset = ((VarDecl) (sym.decl)).offset;
			emitUnary(PUSH, MEM(EBP, offset), sym.name);
		} else if(sym.scope == SymbolTable.CLASS_SCOPE) {
			int offset = ((VarDecl) (sym.decl)).offset;
			emitBinary(MOV, OBJECT, EBX);
			emitUnary(PUSH, MEM(EBX, offset), sym.name);
		} else if(sym.scope == SymbolTable.GLOBAL_SCOPE) {
			emitUnary(PUSH, "_" + text, sym.name);
		}
	}
	
	/**
	 * Adds a comment to the assembly code
	 * @param token For the line number
	 * @param text The comment itself
	 */
	public void emitComment(Token token, String text) {
		emit();
		FileData file = FileData.getOriginalLine(token.getLine());
		String comment = String.format("%s, line %d: %s", file.name, file.lineEnding, text.replace("\t", " ").trim());
		int width = comment.length() + 4;
		String stars = new String(new char[width]).replace("\0", "*");
		String spaces = new String(new char[width]).replace("\0", " ");
		target.add(new CommentInstruction("/" + stars + "\\"));
		target.add(new CommentInstruction("|" + spaces + "|"));
		target.add(new CommentInstruction("|  " + comment + "  |"));
		target.add(new CommentInstruction("|" + spaces + "|"));
		target.add(new CommentInstruction("\\" + stars + "/"));
	}
	
	/**
	 * Adds a comment to the assembly code
	 * @param text The text itself
	 */
	public void emitComment(String text) {
		emitComment(text, true);
	}
	
	/**
	 * Adds a comment to the assembly code
	 * @param text The comment itself
	 * @withSpace Whether or not to use a space before it
	 */
	public void emitComment(String text, boolean withSpace) {
		if(withSpace) { emit(); }
		target.add(new CommentInstruction(text));
	}
	
	/**
	 * Adds a label to the assembly
	 * @param text The label name
	 */
	public void emitLabel(String text) {
		target.add(new LabelInstruction(text));
	}
	
	/**
	 * Adds a section tag to the assembly
	 * @param section The section to add
	 */
	public void emitTag(String section) {
		target.add(new TagInstruction(section));
	}
	
	/**
	 * Adds a section tag with a name to assembly
	 * @param section The section to add
	 * @param name The name of the section
	 */
	public void emitTag(String section, String name) {
		target.add(new TagInstruction(section, name));
	}
	
	/**
	 * Adds a binary instruction to the target code
	 * @param name The instruction 
	 * @param left The left operand
	 * @param right The right operand
	 */
	public void emitBinary(String name, String left, String right) {
		target.add(new BinaryInstruction(name, left, right));
	}
	
	/**
	 * Adds a binary instruction with a comment to target code
	 * @param name The instruction
	 * @param left The left operand
	 * @param right The right operand
	 * @param comment The comment
	 */
	public void emitBinary(String name, String left, String right, String comment) {
		target.add(new BinaryInstruction(name, left, right).addComment(comment));
	}
	
	/**
	 * Adds a unary instruction to the target code
	 * @param name The instruction
	 * @param left The operand
	 */
	public void emitUnary(String name, String left) {
		target.add(new UnaryInstruction(name, left));
	}
	
	/**
	 * Adds a unary instruction with a comment to the target code
	 * @param name The instruction
	 * @param left The operand
	 * @param comment The comment
	 */
	public void emitUnary(String name, String left, String comment) {
		target.add(new UnaryInstruction(name, left).addComment(comment));
	}
	
	/**
	 * Adds null, or a newline, to the instruction list
	 */
	public void emit() {
		target.add(null);
	}
	
	//*************************************************************
	// Helper Methods
	//*************************************************************
	
	/**
	 * Outputs the generated instruction list to an assembly
	 * file with the same name as the input file, with *.floyd
	 * becoming *.s. 
	 */
	public void outputAssembly() {
		// Pre-defined symbols, along with main program
		ClassDecl lastClass = (ClassDecl) sym.lastClass.decl;
		emitMethod("main", 0);
		addObject("Readervtable", 0);
		emitBinary(MOV, EAX, "_in", "Initialize in (Reader)");
		addRef(MEM("_in"), false);
		addObject("Writervtable", 0);
		emitBinary(MOV, EAX, "_out", "Initialize out (Writer)");
		addRef(MEM("_out"), false);
		addObject(lastClass.type.name + "vtable", lastClass.getSize());
		emitUnary(PUSH, EAX);
		lastClass.init(this);
		addRef(MEM(ESP), false);
		emitUnary(CALL, lastClass.name + "_start");
		if(Options.GARBAGE_COLLECTION) {
			emitUnary(PUSH, "_in");
			emitUnary(CALL, "Readerdestroy");
			emitUnary(PUSH, "_out");
			emitUnary(CALL, "Writerdestroy");
			addESP(3, true);
		} else {
			addESP(1, true);
		}
		emitUnary(CALL, "stats");
		emitMethodClose();
		
		// Used by array deallocation in stdlib.c
		emitMethod("calldestroy", 0);
		if(Options.GARBAGE_COLLECTION) {
			if(Options.OUTPUT_64BIT) {
				emitBinary(MOV, BitVersion.PARAM_64[0], EAX);
			} else {
				emitBinary(MOV, OBJECT, EAX);
			}
			emitUnary(PUSH, EAX);
			emitBinary(MOV, EAX, EBX);
			emitBinary(MOV, MEM(EBX), EAX);
			emitBinary(MOV, MEM(EAX, DESTROY_OFFSET), EBX);
			emitUnary(CALL, VCALL);
		}
		emitMethodClose();
		
		// Generate the vtables
		for(Entry<String, Type> entry : Type.getTypes().entrySet()) {
			Type type = entry.getValue();
			if(type.decl != null) {
				type.decl.genVTable(this);
			}
		}
		
		// Optimize any code
		if(Options.OPTIMIZE) {
			new Optimizer(target).optimize();
		}
		
		// Output to the assembly file
		String fileName = Util.getAssemblyFileName();
		try(PrintWriter writer = new PrintWriter(fileName)) {
			for(TargetInstruction i : target) {
				if(i == null) {
					writer.println();
				} else {
					writer.println(i.getText());
				}
			}
		} catch (FileNotFoundException e) {
			System.err.println("Could not write assembly file: " + fileName);
			e.printStackTrace();
			System.exit(1);
		}
	}
	
	/**
	 * Adds to ESP by amt * (4/8), depending on 64/32-bit
	 * @param amt The amount to add by
	 */
	public void addESP(int amt, boolean force) {
		if(Options.OUTPUT_64BIT && !force) {
			emitBinary(ADD, "$" + (Math.max(0, amt - 6) * SIZE), ESP);
		} else {
			emitBinary(ADD, "$" + (amt * SIZE), ESP);
		}
	}
	
	/**
	 * This is used for garbage collection. It adds
	 * a reference to the object's reference count
	 * @param object The object to add to
	 * @param checkNull Whether or not to check nullity
	 */
	public void addRef(String object, boolean checkNull) {
		String destroyLabel = checkNull ? ("_destroy" + destroylabel++) : "";
		
		emitBinary(MOV, object, ECX, "Add reference");
		if(checkNull) {
			emitBinary(CMP, "$0", ECX);
			emitUnary("je", destroyLabel);
		}
		emitBinary(ADD, "$1", MEM(ECX, 1));
		if(checkNull) {
			emitLabel(destroyLabel);
		}
	}
	
	/**
	 * This is also used for garbage collection. It removes
	 * a reference from the object by calling its "destroy" method
	 */
	public void removeRef() {
		String destroy = "_destroy" + destroylabel++;
		
		emitBinary(MOV, MEM(ESP), EBX, "Remove reference");
		emitBinary(CMP, "$0", EBX);
		emitUnary("je", destroy);
		emitBinary(MOV, MEM(EBX), EAX);
		emitBinary(MOV, MEM(EAX, DESTROY_OFFSET), EBX);
		emitUnary(CALL, VCALL);
		emitLabel(destroy);
		addESP(1, true);
	}
	
	/**
	 * This method checks to verify that the object's
	 * assignment or parameter is correct.
	 * @param type The expected type
	 * @param line The line number in code
	 */
	public void checkInherit(Type type, int line) {
		String okay = "_destroy" + destroylabel++;
		String loop = "_destroy" + destroylabel++;
		String goal = "$" + type.name + "vtable";
		FileData file = FileData.getOriginalLine(line);
		
		emitBinary(MOV, MEM(ESP), EBX, "Perform inheritance checks");
		emitBinary(CMP, "$0", EBX);
		emitUnary("je", okay);
		emitLabel(loop);
		emitBinary(MOV, MEM(EBX), EBX);
		emitBinary(CMP, goal, EBX);
		emitUnary("je", okay);
		emitBinary(CMP, "$0", EBX);
		emitUnary("jne", loop);
		
		emitBinary(MOV, MEM(ESP), EBX);
		emitBinary(MOV, MEM(EBX), EAX);
		emitBinary(MOV, MEM(EAX, NAME_OFFSET), EBX);
		emitUnary(CALL, VCALL);
		paramPush(EAX, 4);
		paramPush("$" + type.decl.stringLabel);
		paramPush("$" + files.get(file.name));
		paramPush("$" + file.lineEnding);
		emitBinary(MOV, "$0", EAX);
		emitUnary(CALL, "inheritexception");
		
		emitLabel(okay);
	}
	
	/**
	 * This method emits the code to perform assignment, including
	 * inheritance and null checks. 
	 * @param sym The symbol being assigned to
	 * @param declaration The variable or method declaration
	 * @param line The line number of the assignment
	 */
	public void performAssignment(Symbol sym, boolean declaration, int line) {
		int scope = sym.scope;
		boolean classType = sym.decl.type.classType();
		boolean objectType = classType || sym.decl.dim > 0;
		
		if(Options.CHECK_INHERITANCE && classType) {
			checkInherit(sym.decl.type, line);
		}
		
		if(sym.decl instanceof MethodDecl) {
			// Garbage collection
			if(Options.GARBAGE_COLLECTION && objectType) {
				addRef(MEM(ESP), true);
				emitUnary(PUSH, RET);
				removeRef();
			}
			
			emitUnary(POP, RET, sym.decl.name);
		} else {
			int offset = ((VarDecl) (sym.decl)).offset;
			
			if(scope == SymbolTable.LOCAL_SCOPE) {
				// Garbage collection
				if(Options.GARBAGE_COLLECTION && objectType) {
					addRef(MEM(ESP), true);
					if(!declaration) {
						emitUnary(PUSH, MEM(EBP, offset));
						removeRef();
					}
				}
				
				emitUnary(POP, MEM(EBP, offset), sym.decl.name);
			} else if(scope == SymbolTable.CLASS_SCOPE) {
				// Garbage collection
				if(Options.GARBAGE_COLLECTION && objectType) {
					addRef(MEM(ESP), true);
					if(!declaration) {
						emitBinary(MOV, OBJECT, ECX);
						emitUnary(PUSH, MEM(ECX, offset));
						removeRef();
					}
				}
				 	
				emitBinary(MOV, OBJECT, ECX);
				emitUnary(POP, MEM(ECX, offset), sym.decl.name);
			}
		}
	}
	
	/**
	 * This method adds an object by calling addobject
	 * in the standard C library.
	 * @param vtable The object's vtable
	 * @param size The object's size
	 * @param classID The object's class ID
	 */
	public void addObject(String vtable, int size) {
		paramPush("$" + size, 2);
		paramPush("$" + vtable);
		emitBinary(MOV, "$0", EAX);
		emitUnary(CALL, "addobject");
		addESP(2, false);
	}
	
	/**
	 * A helper for a generic binary expression
	 * @param op The operator/instruction
	 */
	public void binaryExpression(Type type, ParserRuleContext e1, ParserRuleContext e2, String method, String op, int line) {
		if(type.classType()) {
			ArrayList<ParserRuleContext> expList = new ArrayList<>();
			expList.add(e2);
			callMethod(Type.get(ClassDecl.BASE_CLASS).decl.getMethod(method), e1, expList, line);
			emitUnary(PUSH, EAX);
		} else {
			visit(e1);
			visit(e2);
			emitUnary(POP, EBX);
			emitUnary(POP, EAX);
			emitBinary(op, EBX, EAX);
			emitUnary(PUSH, EAX);
		}
	}
	
	/**
	 * Whether or not the method is in stdlib.c
	 * @return True if in stdlib.c
	 */
	public boolean cMethod(String name) {
		return name.equals("Reader_io_read") || name.equals("Writer_io_write");
	}
	
	/**
	 * Calls the given method, handling any stack information
	 * @param methodToken The method name and data
	 * @param expList The parameter expressions
	 * @param caller The caller's type
	 */
	public void callMethod(MethodDecl decl, ParserRuleContext exp, ArrayList<ParserRuleContext> expList, int line) {		
		emitComment("Pushing parameters");
		int params = decl.args.size();
		int regIdx = 0;
		if(cMethod(decl.genName)) { regIdx = params + 1; }
		for(int i = params - 1; i >= 0; i--) {
			ParserRuleContext expContext = expList.get(i);
			Type type = decl.args.get(i).type;
			visit(expContext);
			if(Options.CHECK_INHERITANCE && type.classType()) {
				// Inheritance checks
				checkInherit(type, line);
			}
			
			if(Options.GARBAGE_COLLECTION && type.classType() || decl.args.get(i).dim > 0) {
				// Garbage collection
				addRef(MEM(ESP), true);
			}
			
			emitUnary(POP, EAX);
			paramPush(EAX, regIdx--);
		}
		
		emitComment("Pushing caller");
		if(exp != null) {
			visit(exp);
			emitUnary(POP, EAX);
			paramPush(EAX, regIdx--);
		} else { 
			paramPush(OBJECT, regIdx--); 
		}
		
		String object = BitVersion.LAST_REG;
		
		// Null checks
		if(Options.NULL_CHECKS) {
			String label = "_nulltest" + nulllabel++;
			emitComment("Performing null checks");
			emitBinary(MOV, object, EBX);
			emitBinary(CMP, "$0", EBX);
			emitUnary("jne", label);
			FileData data = FileData.getOriginalLine(line);
			paramPush("$" + files.get(data.name), 2);
			paramPush("$" + data.lineEnding);
			emitBinary(MOV, "$0", EAX);
			emitUnary(CALL, "nullexception");
			emitLabel(label);
		}
		
		// Garbage collection
		if(Options.GARBAGE_COLLECTION) {
			emitComment("Garbage collection (caller)");
			addRef(object, false);
		}
		
		// Method call
		emitComment("Call method");
		emitBinary(MOV, object, EBX);
		emitBinary(MOV, MEM(EBX), EAX);
		emitBinary(MOV, MEM(EAX, decl.offset), EBX);
		emitUnary(CALL, VCALL, decl.name + "()");
		if(cMethod(decl.genName)) {
			addESP(params + 1, false);
		} else {
			addESP(params + 1, true);
		}
	}
	
	//*************************************************************
	// Class Visitors
	//*************************************************************

	@Override
	public Void visitKlass(KlassContext ctx) {
		emitComment(ctx.start, FileData.getLine(ctx.start.getLine()));
		
		String name = ctx.name.getText();
		Type type = Type.get(name);
		AsciiArt.printString(name, this);
		
		// Init - only output if necessary
		int count = 0;
		for(VarDeclContext varDecl : ctx.varDecl()) {
			if(varDecl.exp() != null) { count++; }
		}
		if(count > 0) {
			emitMethod(name + "init", 0);
			for(VarDeclContext varDecl : ctx.varDecl()) {
				visit(varDecl);
			}
			emitMethodClose();
		} else {
			type.decl.genInit = false;
		}
		
		// Destroy, Name, and Type Methods
		type.decl.genDestroy(this);
		type.decl.genName(this);
		type.decl.genType(this);
		
		// Other methods
		for(MethodDeclContext methodDecl : ctx.methodDecl()) {
			visit(methodDecl);
		}
		
		return null;
	}
	
	//*************************************************************
	// Method Visitors
	//*************************************************************

	@Override
	public Void visitMethodDecl(MethodDeclContext ctx) {
		emitComment(ctx.start, FileData.getLine(ctx.start.getLine()));
		
		MethodDecl decl = ctx.decl;
		emitMethod(decl.genName, 1 + decl.locals.size());
		
		emitComment("Initializing locals");
		emitBinary(MOV, "$0", RET);
		for(VarDeclContext varDecl : ctx.varDecl()) {
			visit(varDecl);
		}
		
		if(ctx.stmtList().stmts.size() != 0) { emitComment("Statement list"); } 
		visit(ctx.stmtList());
	
		// Garbage collection
		if(Options.GARBAGE_COLLECTION) {
			if(decl.locals.size() != 0) { emitComment("Garbage collection (locals)"); }
			for(int i = 0; i < decl.locals.size(); i++) {
				VarDecl cur = decl.locals.get(i);
				if(cur.type.classType() || cur.dim > 0) {
					emitUnary(PUSH, MEM(EBP, cur.offset), cur.name);
					removeRef();
				}
			}
			
			if(decl.args.size() != 0) { emitComment("Garbage collection (args)"); }
			for(int i = 0; i < decl.args.size(); i++) {
				VarDecl cur = decl.args.get(i);
				if(cur.type.classType() || cur.dim > 0) {
					emitUnary(PUSH, MEM(EBP, cur.offset), cur.name);
					removeRef();
				}
			}
			
			emitComment("Garbage collection (caller)");
			emitUnary(PUSH, OBJECT);
			emitBinary(MOV, MEM(ESP), EBX);
			emitBinary(MOV, MEM(EBX), EAX);
			emitBinary(MOV, MEM(EAX, DESTROY_OFFSET), EBX);
			emitUnary(CALL, VCALL);
			addESP(1, true);
		}
		
		emitComment("Method close");
		emitBinary(MOV, RET, EAX);

		if(Options.GARBAGE_COLLECTION && decl.type.classType() || decl.dim > 0) {
			emitComment("Garbage collection (return value)");
			String label = "_destroy" + destroylabel++;
			emitBinary(MOV, RET, EAX);
			emitBinary(CMP, "$0", EAX);
			emitUnary("je", label);
			emitBinary(SUB, "$1", MEM(EAX, 1));
			emitLabel(label);
		}
		
		emitMethodClose();
		return null;
	}
	
	@Override
	public Void visitVarDecl(VarDeclContext ctx) {
		emitComment(ctx.start, FileData.getLine(ctx.start.getLine()));
		if(ctx.exp() != null) {
			visit(ctx.exp());
			performAssignment(ctx.sym, true, ctx.start.getLine());
		} else {
			if(ctx.sym.scope == SymbolTable.LOCAL_SCOPE) {
				int offset = ((VarDecl) (ctx.sym.decl)).offset;
				emitBinary(MOV, "$0", MEM(EBP, offset));
			}
		}
		
		return null;
	}
	
	//*************************************************************
	// Statement Visitors
	//*************************************************************

	@Override
	public Void visitStmt(StmtContext ctx) {
		int line = ctx.start.getLine();
		emitComment(ctx.start, FileData.getLine(line));
		super.visitStmt(ctx);
		
		return null;
	}
	
	@Override
	public Void visitAssignStmt(AssignStmtContext ctx) {		
		int array = ctx.arr.size();
		int scope = ctx.sym.scope;
		
		if(array > 0) { // Array assignment
			int offset = ((VarDecl) (ctx.sym.decl)).offset;
			int params = 5 + array;
			int regIdx = params;
			for(int i = array - 1; i >= 0; i--) {
				visit(ctx.arr.get(i));
				emitUnary(POP, EAX);
				paramPush(EAX, regIdx--);
			}
			paramPush("$" + array, regIdx--);
			paramPush("$1", regIdx--);
			if(scope == SymbolTable.LOCAL_SCOPE) {
				paramPush(MEM(EBP, offset), regIdx--);
			} else if(scope == SymbolTable.CLASS_SCOPE) {
				emitBinary(MOV, OBJECT, EAX);
				paramPush(MEM(EAX, offset), regIdx--);
			}
			FileData file = FileData.getOriginalLine(ctx.start.getLine());
			paramPush("$" + files.get(file.name), regIdx--);
			paramPush("$"+ file.lineEnding, regIdx--);
			emitBinary(MOV, "$0", EAX);
			emitUnary(CALL, "indexarray");
			addESP(params, false);
			emitUnary(PUSH, EAX);
			visit(ctx.value);
			
			// Garbage collection
			if(Options.GARBAGE_COLLECTION && ctx.sym.decl.type.classType()) {
				addRef(MEM(ESP), true);
				
				emitBinary(MOV, MEM(ESP, 1), EAX);
				emitUnary(PUSH, MEM(EAX));
				removeRef();
			}
			
			emitUnary(POP, EAX);
			emitUnary(POP, ECX);
			emitBinary(MOV, EAX, MEM(ECX));
		} else {
			visit(ctx.value);
			performAssignment(ctx.sym, false, ctx.start.getLine());
		}
		
		return null;
	}

	@Override
	public Void visitIfStmt(IfStmtContext ctx) {
		String ifLabel = String.format("_if%d", iflabel);
		String elseLabel = String.format("_else%d", iflabel);
		String endLabel = String.format("_endif%d", iflabel++);
		
		visit(ctx.test);
		emitUnary(POP, EAX);
		emitBinary(CMP, "$0", EAX);
		emitUnary("jne", ifLabel);
		emitUnary("jmp", elseLabel);
		emitLabel(ifLabel);
		visit(ctx.good);
		emitUnary("jmp", endLabel);
		emitLabel(elseLabel);
		if(ctx.bad != null) { visit(ctx.bad); }
		emitLabel(endLabel);
		
		return null;
	}

	@Override
	public Void visitLoopStmt(LoopStmtContext ctx) {
		String whileLabel = String.format("_while%d", looplabel);
		String bodyLabel = String.format("_whilebody%d", looplabel);
		String endLabel = String.format("_endwhile%d", looplabel++);
		
		emitLabel(whileLabel);
		visit(ctx.test);
		emitUnary(POP, EAX);
		emitBinary(CMP, "$0", EAX);
		emitUnary("jne", bodyLabel);
		emitUnary("jmp", endLabel);
		emitLabel(bodyLabel);
		visit(ctx.stmtList());
		emitUnary("jmp", whileLabel);
		emitLabel(endLabel);
		
		return null;
	}

	@Override
	public Void visitCallStmt(CallStmtContext ctx) {
		ArrayList<ParserRuleContext> expList = new ArrayList<>();
		if(ctx.expList() != null) {
			expList.addAll(ctx.expList().exps);
		}
		callMethod(ctx.decl, ctx.exp(), expList, ctx.start.getLine());	
		if(Options.GARBAGE_COLLECTION && ctx.decl.type.classType() || ctx.decl.dim > 0) {
			String destroy = "_destroy" + gen.destroylabel++;
			emitUnary(PUSH, EAX, "Test for variable destruction");
			emitBinary(MOV, MEM(ESP), EBX);
			emitBinary(CMP, "$0", EBX);
			emitUnary("je", destroy);
			emitBinary(CMP, "$0", MEM(EBX, 1));
			emitUnary("jg", destroy);
			emitBinary(MOV, MEM(EBX), EAX);
			emitBinary(MOV, MEM(EAX, DESTROY_OFFSET), EBX);
			emitUnary(CALL, VCALL);
			
			gen.emitLabel(destroy);
		}
		
		return null;
	}
	
	//*************************************************************
	// Type Visitors
	//*************************************************************
	
	@Override
	public Void visitArrayType(ArrayTypeContext ctx) {
		if(ctx.exp() != null) { 
			visit(ctx.exp());
			emitUnary(POP, EAX);
			paramPush(EAX);
		}
		visit(ctx.dataType());
		
		return null;
	}
	
	//*************************************************************
	// Expression Visitors
	//*************************************************************

	@Override
	public Void visitOrExp(OrExpContext ctx) {
		binaryExpression(ctx.type, ctx.e1, ctx.e2, "_or_", OR, ctx.start.getLine());
		return null;
	}

	@Override
	public Void visitAndExp(AndExpContext ctx) {
		binaryExpression(ctx.type, ctx.e1, ctx.e2, "_and_", AND, ctx.start.getLine());
		return null;
	}

	@Override
	public Void visitBoolExp(BoolExpContext ctx) {
		String op = ctx.op.getText();
		
		if(ctx.type.classType() && !op.equals("=") && !op.equals("!=")) {
			ArrayList<ParserRuleContext> expList = new ArrayList<>();
			expList.add(ctx.e2);

			if(op.equals(">")) {
				callMethod(Type.get(ClassDecl.BASE_CLASS).decl.getMethod("_gt_"), ctx.e1, expList, ctx.start.getLine());
			} else if(op.equals(">=")) {
				callMethod(Type.get(ClassDecl.BASE_CLASS).decl.getMethod("_gteq_"), ctx.e1, expList, ctx.start.getLine());
			} else if(op.equals("<")) {
				callMethod(Type.get(ClassDecl.BASE_CLASS).decl.getMethod("_lt_"), ctx.e1, expList, ctx.start.getLine());
			} else if(op.equals("<=")) {
				callMethod(Type.get(ClassDecl.BASE_CLASS).decl.getMethod("_lteq_"), ctx.e1, expList, ctx.start.getLine());
			}
			
			emitUnary(PUSH, EAX);
		} else {
			visit(ctx.e2);
			visit(ctx.e1);
			
			emitUnary(POP, EAX);
			emitUnary(POP, EBX);
			emitBinary(CMP, EBX, EAX);
			
			if(op.equals(">")) {
				emitUnary("setg", "%al");
			} else if(op.equals(">=")) {
				emitUnary("setge", "%al");
			} else if(op.equals("<")) {
				emitUnary("setl", "%al");
			} else if(op.equals("<=")) {
				emitUnary("setle", "%al");
			} else if(op.equals("!=")) {
				emitUnary("setne", "%al");
			} else {
				emitUnary("sete", "%al");
			}
			
			emitBinary(ZMOV, "%al", EAX);
			emitUnary(PUSH, EAX);
		}
		
		return null;
	}

	@Override
	public Void visitConcatExp(ConcatExpContext ctx) {
		binaryExpression(ctx.type, ctx.e1, ctx.e2, "_cat_", "", ctx.start.getLine());
		return null;
	}

	@Override
	public Void visitAddExp(AddExpContext ctx) {
		if(ctx.op.getText().equals("+")) {
			binaryExpression(ctx.type, ctx.e1, ctx.e2, "_add_", ADD, ctx.start.getLine());
		} else {
			binaryExpression(ctx.type, ctx.e1, ctx.e2, "_sub_", SUB, ctx.start.getLine());
		}
		return null;
	}

	@Override
	public Void visitMultExp(MultExpContext ctx) {
		String op = ctx.op.getText();
		if(ctx.type.classType()) {
			ArrayList<ParserRuleContext> expList = new ArrayList<>();
			expList.add(ctx.e2);
			callMethod(Type.get(ClassDecl.BASE_CLASS).decl.getMethod(op.equals("*") ? "_mul_" : "_div_"), ctx.e1, expList, ctx.start.getLine());
			emitUnary(PUSH, EAX);
		} else if(op.equals("*")) {
			binaryExpression(Type.INT, ctx.e1, ctx.e2, "_mul_", MUL, ctx.start.getLine());
		} else {
			visit(ctx.e1);
			visit(ctx.e2);
			
			emitUnary(POP, EBX);
			emitUnary(POP, EAX);
			emitUnary(PUSH, EDX);
			emitBinary(MOV, "$0", EDX);
			emitUnary(DIV, EBX);
			emitUnary(POP, EDX);
			emitUnary(PUSH, EAX);
		}
		
		return null;
	}

	@Override
	public Void visitUnaryExp(UnaryExpContext ctx) {
		visit(ctx.call_exp());
		if(ctx.op != null) {
			if(ctx.op.getText().equals("-")) {
				emitUnary(POP, EAX);
				emitUnary(NEG, EAX);
				emitUnary(PUSH, EAX);
			} else if(ctx.op.getText().equals("not")) {
				emitUnary(POP, EAX);
				emitBinary(XOR, "$1", EAX);
				emitUnary(PUSH, EAX);
			}
		}
		return null;
	}

	@Override
	public Void visitCallBasicExp(CallBasicExpContext ctx) {
		ArrayList<ParserRuleContext> expList = new ArrayList<>();
		if(ctx.expList() != null) {
			expList.addAll(ctx.expList().exps);
		}
		callMethod(ctx.decl, null, expList, ctx.start.getLine());
		emitUnary(PUSH, EAX);
		
		return null;
	}

	@Override
	public Void visitCallExp(CallExpContext ctx) {
		ArrayList<ParserRuleContext> expList = new ArrayList<>();
		if(ctx.expList() != null) {
			expList.addAll(ctx.expList().exps);
		}
		callMethod(ctx.decl, ctx.call_exp(), expList, ctx.start.getLine());
		emitUnary(PUSH, EAX);
		
		return null;
	}

	@Override
	public Void visitNewExp(NewExpContext ctx) {
		if(ctx.dim > 0) { // Array
			int params = 3 + ctx.dim;
			BitVersion.PARAM_IDX = params;
			visit(ctx.dataType());
			paramPush("$" + ctx.dim);
			if(ctx.callerType.classType()) {
				paramPush("$" + ctx.callerType.name + "vtable");
			} else {
				paramPush("$0");
			}
			paramPush("$Arrayvtable");
			emitBinary(MOV, "$0", EAX);
			emitUnary(CALL, "addarray");
			addESP(params, false);
			emitUnary(PUSH, EAX);
		} else if(ctx.callerType.classType()) {
			addObject(ctx.callerType.name + "vtable", ctx.callerType.decl.getSize());
			emitUnary(PUSH, EAX);
			ctx.callerType.decl.init(this);
		} else {
			emitUnary(PUSH, "$0"); // int, boolean
		}
		
		return null;
	}

	@Override
	public Void visitArrayExp(ArrayExpContext ctx) {
		int params = 5 + ctx.exp().size();
		int regIdx = params;
		for(int i = ctx.exp().size() - 1; i >= 0; i--) {
			visit(ctx.exp(i));
			emitUnary(POP, EAX);
			paramPush(EAX, regIdx--);
		}
		paramPush("$" + ctx.exp().size(), regIdx--);
		paramPush("$0", regIdx--);
		emitIdentifier(ctx.sym, ctx.IDENT().getText());
		emitUnary(POP, EAX);
		paramPush(EAX, regIdx--);
		FileData file = FileData.getOriginalLine(ctx.start.getLine());
		paramPush("$" + files.get(file.name), regIdx--);
		paramPush("$"+ file.lineEnding, regIdx--);
		emitBinary(MOV, "$0", EAX);
		emitUnary(CALL, "indexarray");
		addESP(params, false);
		emitUnary(PUSH, EAX);
		
		return null;
	}

	@Override
	public Void visitIdentExp(IdentExpContext ctx) {
		emitIdentifier(ctx.sym, ctx.getText());
		return null;
	}

	@Override
	public Void visitStringExp(StringExpContext ctx) {
		String label = emitString(ctx.getText(), true);
		paramPush("$Stringvtable", 2);
		paramPush("$" + label);
		emitBinary(MOV, "$0", EAX);
		emitUnary(CALL, "createstring");
		addESP(2, false);
		emitUnary(PUSH, EAX);
		return null;
	}

	@Override
	public Void visitIntExp(IntExpContext ctx) {
		emitUnary(PUSH, "$" + ctx.getText());
		return null;
	}

	@Override
	public Void visitTrueExp(TrueExpContext ctx) {
		emitUnary(PUSH, "$1");
		return null;
	}

	@Override
	public Void visitFalseExp(FalseExpContext ctx) {
		emitUnary(PUSH, "$0");
		return null;
	}

	@Override
	public Void visitNullExp(NullExpContext ctx) {
		emitUnary(PUSH, "$0");
		return null;
	}

	@Override
	public Void visitMeExp(MeExpContext ctx) {
		emitUnary(PUSH, OBJECT);
		return null;
	}
	
}
