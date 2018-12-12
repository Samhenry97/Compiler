/*
 * File: SemanticChecker.java
 * Author: Sam Henry 
 * Date: February 20, 2018
 * Class: CpS 450, Compiler
 * Desc: The semantic checker for the compiler
 */

package cps450;

import org.antlr.v4.runtime.Token;

import cps450.FloydParser.*;
import cps450.declarations.*;
import cps450.exceptions.SemanticError;

public class SemanticChecker extends FloydBaseVisitor<Type> {
	private SymbolTable sym;	// The symbol table
	private Type curClassType; // The current class
	private String curMethodName; // The current method
	
	/**
	 * Constructs the semantic checker.
	 * Initializes all predefined variables and classes.
	 */
	public SemanticChecker(SymbolTable sym) {
		this.sym = sym;
		
		// Initialize predefined symbols
		Type.init();
	}
	
	//*************************************************************
	// Helper Methods
	//*************************************************************
	
	/**
	 * Makes sure that the last class contains
	 * a valid start method
	 */
	public void checkStart() {
		ClassDecl decl = (ClassDecl) (sym.lastClass.decl);
		MethodDecl start = decl.getMethod("start");
		String className = decl.type.name;
		if(start == null) {
			new SemanticError(null).error(String.format("Class %s must contain start() method", className));
		} else if(!start.type.equals(Type.VOID) || start.args.size() != 0) {
			String message = String.format("Class %s's start() method must have 0 parameters and return void", className);
			new SemanticError(null).error(message);
		}
	}
	
	/**
	 * Checks to see if a method is valid in the 
	 * given context. Does type checking, parameter
	 * count checking, and parameter checking
	 * @param methodToken The token of the method
	 * @param expList The method's expression list
	 * @param caller The type of the method's caller (if available)
	 * @return The method declaration for the given data
	 */
	public MethodDecl checkMethod(Token methodToken, ExpListContext expList, Type caller) {
		String methodName = methodToken.getText();
		MethodDecl method = null;
		ClassDecl cls = null;
		
		if(caller == null) {
			cls = curClassType.decl;
		} else {
			cls = caller.decl;
		}
		
		if(cls == null) {
			String err = String.format("Unknown method \"%s\"", methodToken.getText());
			new SemanticError(methodToken).error(err);
			return null;
		} else {
			method = cls.getMethod(methodName);
		}
		
		if(method == null && caller == null) {
			new SemanticError(methodToken).undefined("method");
		} else if(method == null) {
			String err = String.format("Unknown method \"%s\" for type \"%s\"", methodToken.getText(), caller.name);
			new SemanticError(methodToken).error(err);
		} else {
			int params = expList == null ? 0 : expList.exps.size();
			
			if(method.args.size() != params) {
				new SemanticError(methodToken).parameterCount(params, method.args.size());
			} else if(expList != null) {
				for(int i = 0; i < expList.exps.size(); i++) {
					ExpContext exp = expList.exps.get(i);
					Type actual = visit(exp);
					Type expected = method.args.get(i).type;
					int leftDim = method.args.get(i).dim;
					int rightDim = exp.dim;
					if(!expected.eq(actual, leftDim, rightDim)) {
						new SemanticError(exp.start).parameterType(methodName, expected.name(leftDim), actual.name(rightDim), i + 1);
					}
				}
			}
		}
		
		return method;
	}
	
	/**
	 * Checks a binary expression for validity. Only
	 * works for binary expressions with both types that are the same.
	 * @param start The token to display an error if applicable
	 * @param opText The operator string
	 * @param left The left hand type
	 * @param right The right hand type
	 * @param goal The type that left and right should be
	 * @return Error if the expression is bad, goal otherwise
	 */
	public Type checkBinaryExp(Token start, String opText, Type left, Type right, int leftDim, int rightDim, Type goal) {
		if(left.classType()) { // Operator overloading
			if(!left.eq(right, leftDim, rightDim)) {
				new SemanticError(start).typeError(opText, "class type or " + goal.name, left.name(leftDim), right.name(rightDim));
				return Type.ERROR;
			} else {
				return left;
			}
		} else if(!left.eq(goal, leftDim, 0) || !right.eq(goal, rightDim, 0)) {
			new SemanticError(start).typeError(opText, goal.name, left.name(leftDim), right.name(rightDim));
			return Type.ERROR;
		} else {
			return goal;
		}
	}
	
	//*************************************************************
	// Class Visitors
	//*************************************************************
	
	@Override
	public Type visitKlass(KlassContext ctx) {
		String className = ctx.name.getText();
		Symbol var = sym.lookup(className);
		
		if(!className.equals(ctx.endName.getText())) {
			new SemanticError(ctx.endName).error("Start and end class names must match");
		}
		
		if(var != null && var.scope == sym.getScope()) {
			new SemanticError(ctx.name).redeclaration("class");
			return null;
		}
		
		if(className.equals("String")) {
			curClassType = Type.STRING;
		} else {
			curClassType = Type.add(className);
		}
		
		if(className.equals("Reader")) {
			sym.push("in", new VarDecl(curClassType));
		} else if(className.equals("Writer")) {
			sym.push("out", new VarDecl(curClassType));
		}
		
		ClassDecl curClass = new ClassDecl(curClassType);
		curClassType.decl = curClass;
		sym.push(className, curClass);
		sym.beginScope();
		
		if(ctx.inherit != null) { 
			Type inherit = Type.get(ctx.inherit.getText());
			if(inherit == null) {
				new SemanticError(ctx.inherit).undefined("class");
			} else {
				curClass.addInherit(inherit.decl);
			}
		} else if(!className.equals(ClassDecl.BASE_CLASS)) {
			Symbol inherit = sym.lookup(ClassDecl.BASE_CLASS);
			curClass.addInherit((ClassDecl) inherit.decl);
		}
		
		for(int i = 0; i < ctx.varDecl().size(); i++) {
			VarDeclContext varCtx = ctx.varDecl(i);
			visit(varCtx);
			if(varCtx.sym != null) {
				curClass.addVar((VarDecl) varCtx.sym.decl);
			}
		}
		
		if(className.equals("Reader")) {
			MethodDecl read = new MethodDecl(Type.INT);
			read.name = "io_read";
			read.genName = "Reader_io_read";
			curClass.addMethod(read);
			sym.push("io_read", read);
		} else if(className.equals("Writer")) {
			MethodDecl write = new MethodDecl(Type.VOID);
			write.name = "io_write";
			write.genName = "Writer_io_write";
			write.args.add(new VarDecl(Type.INT, 1));
			curClass.addMethod(write);
			sym.push("io_write", write);
		}
		
		// Garbage collection, inheritance checks, and type checks
		MethodDecl destroy = new MethodDecl(Type.VOID, className, "destroy", true);
		curClass.addMethod(destroy);
		MethodDecl name = new MethodDecl(Type.INT, className, "name", true);
		curClass.addMethod(name);
		MethodDecl type = new MethodDecl(Type.INT, className, "type");
		curClass.addMethod(type);
		sym.push("type", type);
		
		// General methods
		for(int i = 0; i < ctx.methodDecl().size(); i++) {
			MethodDeclContext methodCtx = ctx.methodDecl(i);
			String methName = methodCtx.name.getText();
			methodCtx.decl = new MethodDecl(Type.VOID, className, methName);
			visit(methodCtx);
			if(methodCtx.decl != null) {
				curClass.addMethod(methodCtx.decl);
				visit(methodCtx.stmtList());
				sym.endScope();
			}	
		}

		sym.endScope();
		return curClassType;
	}
	
	//*************************************************************
	// Method Visitors
	//*************************************************************

	@Override
	public Type visitMethodDecl(MethodDeclContext ctx) {
		curMethodName = ctx.name.getText();
		Symbol var = sym.lookup(curMethodName);
		
		if(!curMethodName.equals(ctx.endName.getText())) {
			new SemanticError(ctx.endName).error("Start and end method names must match");
		}
		
		if(var != null && var.scope == sym.getScope()) {
			new SemanticError(ctx.name).redeclaration("method");
			ctx.decl = null;
		} else {
			if(ctx.dataType() != null) { 
				ctx.decl.type = visit(ctx.dataType());
				ctx.decl.dim = ctx.dataType().dim;
			}
			sym.push(curMethodName, ctx.decl);
			sym.beginScope();
			
			if(ctx.argDeclList() != null) {
				for(int i = 0; i < ctx.argDeclList().argDecl().size(); i++) {
					ArgDeclContext argCtx = ctx.argDeclList().argDecl(i);
					visit(argCtx);
					if(argCtx.decl != null) {
						argCtx.decl.dim = argCtx.dataType().dim;
						ctx.decl.args.add(argCtx.decl);
						argCtx.decl.offset = 3 + i;
					}
				}
			}
			
			if(ctx.varDecl() != null) {
				for(int i = 0; i < ctx.varDecl().size(); i++) {
					VarDeclContext varCtx = ctx.varDecl(i);
					visit(varCtx);
					if(varCtx.sym != null) {
						ctx.decl.locals.add((VarDecl) varCtx.sym.decl);
						((VarDecl) (varCtx.sym.decl)).offset = -2 - i;
					}
				}
			}
		}
		
		return null;
	}
	
	@Override
	public Type visitArgDecl(ArgDeclContext ctx) {
		String argName = ctx.name.getText();
		Type type = ctx.dataType() == null ? null : visit(ctx.dataType());
		Symbol var = sym.lookup(argName);
		if(var != null && var.scope == sym.getScope()) {
			new SemanticError(ctx.name).redeclaration("argument");
		} else {
			ctx.decl = new VarDecl(type, argName);
			if(ctx.dataType() != null) { ctx.decl.dim = ctx.dataType().dim; }
			sym.push(argName, ctx.decl);
		}
		return null;
	}

	@Override
	public Type visitVarDecl(VarDeclContext ctx) {
		String varName = ctx.name.getText();
		Type type = ctx.dataType() == null ? null : visit(ctx.dataType());
		Type init = ctx.init == null ? null : visit(ctx.init);
		Symbol var = sym.lookup(varName);
		
		if(var != null && var.scope == sym.getScope()) {
			new SemanticError(ctx.name).redeclaration("variable");
		} else {
			if(type == null && init == null) {
				new SemanticError(ctx.name).error("Data type expected");
				type = init = Type.ERROR;
			} else if(type != null && init == null) {
				init = type;
			} else if(type == null && init != null) {
				type = init;
			}
			
			int leftDim = ctx.dataType() == null ? -1 : ctx.dataType().dim;
			int rightDim = ctx.init == null ? leftDim : ctx.init.dim;
			if(leftDim == -1) { leftDim = rightDim; }
			
			if(!type.eq(init, leftDim, rightDim)) {
				new SemanticError(ctx.name).typeError("variable", type.name(leftDim), init.name(rightDim));
			}
			
			VarDecl decl = new VarDecl(type, varName);
			if(ctx.dataType() != null) {
				decl.dim = leftDim;
			}  else if(ctx.init != null) {
				decl.dim = rightDim;
			} else {
				decl.dim = 0;
			}
			ctx.sym = sym.push(varName, decl);
		}
		
		return null;
	}
	
	//*************************************************************
	// Statement Visitors
	//*************************************************************
	
	@Override
	public Type visitAssignStmt(AssignStmtContext ctx) {
		String varName = ctx.var.getText();
		Symbol ident = sym.lookup(varName);
		Type type = visit(ctx.value);
		ctx.sym = ident;
		for(ExpContext expContext : ctx.arr) {
			Type expType = visit(expContext);
			if(!expType.eq(Type.INT, expContext.dim, 0)) {
				new SemanticError(ctx.start).error("Array index must be int, got " + expType.name(expContext.dim));
			}
		}
		
		if(ident == null || (!(ident.decl instanceof VarDecl) && !(ident.decl instanceof MethodDecl))) {
			new SemanticError(ctx.var).undefined("variable");
			return null;
		} 
		
		if(ctx.arr.size() > ident.decl.dim) {
			new SemanticError(ctx.start).error("Index size must be at most declared size");
		}
		
		if(ident.decl instanceof MethodDecl) {
			if(!varName.equals(curMethodName)) {
				new SemanticError(ctx.start).error("Method assignment must be inside current method: " + curMethodName);
			}
			if(ctx.arr.size() > 0) {
				new SemanticError(ctx.start).error("Cannot index a method return statement");
			}
		} else {
			int leftDim = ident.decl.dim - ctx.arr.size();
			int rightDim = ctx.value.dim;
			
			if(!ident.decl.type.classType() && type.equals(Type.NULL)) {
				new SemanticError(ctx.start).error("Cannot assign null to int or bool");
			} else if(!ident.decl.type.eq(type, leftDim, rightDim)) {
				String err = String.format("Type mismatch in assignment statement: expected %s on RHS, got %s", 
						ident.decl.type.name(leftDim), 
						type.name(rightDim));
				new SemanticError(ctx.start).error(err);				
			} else if(ident.scope == SymbolTable.GLOBAL_SCOPE) {
				new SemanticError(ctx.start).error("Cannot assign to variables in global scope");
			}
			ctx.sym = ident;
		}
		
		return null;
	}

	@Override
	public Type visitLoopStmt(LoopStmtContext ctx) {
		Type type = visit(ctx.test);
		if(!type.eq(Type.BOOL, ctx.test.dim, 0)) {
			new SemanticError(ctx.start).typeError("while loop", "boolean", type.name(ctx.test.dim));
		}
		visit(ctx.stmtList());
		return null;
	}

	@Override
	public Type visitIfStmt(IfStmtContext ctx) {
		Type type = visit(ctx.test);
		if(!type.eq(Type.BOOL, ctx.test.dim, 0)) {
			new SemanticError(ctx.start).typeError("if statement", "boolean", type.name(ctx.test.dim));
		}
		visit(ctx.good);
		if(ctx.bad != null) { visit(ctx.bad); }
		return null;
	}
	
	@Override
	public Type visitCallStmt(CallStmtContext ctx) {
		ctx.callerType = ctx.exp() != null ? visit(ctx.exp()) : null;
		ctx.decl = checkMethod(ctx.method, ctx.expList(), ctx.callerType);
		return null;
	}
	
	//*************************************************************
	// Type Visitors
	//*************************************************************

	@Override
	public Type visitClassType(ClassTypeContext ctx) {
		ctx.dim = 0;
		String className = ctx.IDENT().getText();
		Type classType = Type.get(className);
		if(classType != null) { 
			return classType;
		} else {
			new SemanticError(ctx.start).error("Unknown data type: " + className);
			return Type.ERROR; 
		}
	}
	
	@Override
	public Type visitArrayType(ArrayTypeContext ctx) {
		Type type = visit(ctx.dataType());
		ctx.dim = ctx.dataType().dim + 1;
		if(ctx.exp() != null) {
			Type expType = visit(ctx.exp());
			if(!expType.eq(Type.INT, ctx.exp().dim, 0)) {
				new SemanticError(ctx.start).error("Array dimension expects int, got " + expType.name(ctx.exp().dim));
			}
		}
		return type;
	}

	@Override
	public Type visitBoolType(BoolTypeContext ctx) {
		ctx.dim = 0;
		return Type.BOOL;
	}

	@Override
	public Type visitStringType(StringTypeContext ctx) {
		ctx.dim = 0;
		return Type.STRING;
	}

	@Override
	public Type visitIntType(IntTypeContext ctx) {
		ctx.dim = 0;
		return Type.INT;
	}
	
	//*************************************************************
	// Expression Visitors
	//*************************************************************
	
	@Override
	public Type visitOrExp(OrExpContext ctx) {
		Type left = visit(ctx.e1);
		Type right = visit(ctx.e2);
		ctx.dim = 0;
		ctx.type = checkBinaryExp(ctx.start, ctx.op.getText(), left, right, ctx.e1.dim, ctx.e2.dim, Type.BOOL);
		return ctx.type;
	}

	@Override
	public Type visitAndExp(AndExpContext ctx) {
		Type left = visit(ctx.e1);
		Type right = visit(ctx.e2);
		ctx.dim = 0;
		ctx.type = checkBinaryExp(ctx.start, ctx.op.getText(), left, right, ctx.e1.dim, ctx.e2.dim, Type.BOOL);
		return ctx.type;
	}

	@Override
	public Type visitBoolExp(BoolExpContext ctx) {
		Type left = visit(ctx.e1);
		Type right = visit(ctx.e2);
		int leftDim = ctx.e1.dim;
		int rightDim = ctx.e2.dim;
		String op = ctx.op.getText();
		ctx.dim = 0;
		ctx.type = right;
		
		if(op.equals("=") || op.equals("!=")) {
			if(!left.eq(right, leftDim, rightDim) || leftDim > 0) {
				new SemanticError(ctx.start).typeError(op, "class type, int, or boolean", left.name(leftDim), right.name(rightDim));
				return Type.ERROR;
			} else {
				return Type.BOOL;
			}
		} else { // >, >=
			if(!left.eq(right, leftDim, rightDim) || left.eq(Type.BOOL, leftDim, 0) || leftDim > 0) {
				new SemanticError(ctx.start).typeError(op, "class type or int", left.name(leftDim), right.name(rightDim));
				return Type.ERROR;
			} else {
				return Type.BOOL;
			}
		}
	}

	@Override
	public Type visitConcatExp(ConcatExpContext ctx) {
		Type left = visit(ctx.e1);
		Type right = visit(ctx.e2);
		ctx.dim = 0;
		ctx.type = checkBinaryExp(ctx.start, ctx.op.getText(), left, right, ctx.e1.dim, ctx.e2.dim, Type.STRING);
		return ctx.type;
	}

	@Override
	public Type visitAddExp(AddExpContext ctx) {
		Type left = visit(ctx.e1);
		Type right = visit(ctx.e2);
		ctx.dim = 0;
		ctx.type = checkBinaryExp(ctx.start, ctx.op.getText(), left, right, ctx.e1.dim, ctx.e2.dim, Type.INT);
		return ctx.type;
	}

	@Override
	public Type visitMultExp(MultExpContext ctx) {
		Type left = visit(ctx.e1);
		Type right = visit(ctx.e2);
		ctx.dim = 0;
		ctx.type = checkBinaryExp(ctx.start, ctx.op.getText(), left, right, ctx.e1.dim, ctx.e2.dim, Type.INT);
		return ctx.type;
	}

	@Override
	public Type visitUnaryExp(UnaryExpContext ctx) {
		Type type = visit(ctx.call_exp());
		String op = ctx.op == null ? "" : ctx.op.getText();
		ctx.dim = ctx.call_exp().dim;
		if(ctx.op == null) {
			return type;
		} else if(op.equals("+") || op.equals("-")) {
			if(!type.eq(Type.INT, ctx.dim, 0)) {
				new SemanticError(ctx.start).typeError(op, Type.INT.name, type.name(ctx.dim));
				return Type.ERROR;
			} else {
				return type;
			}
		} else {
			if(!type.eq(Type.BOOL, ctx.dim, 0)) {
				new SemanticError(ctx.start).typeError(op, Type.BOOL.name, type.name(ctx.dim));
				return Type.ERROR;
			} else {
				return type;
			}
		}
	}
	
	@Override
	public Type visitCallBasicExp(CallBasicExpContext ctx) {
		ctx.callerType = curClassType.decl.getMethod(ctx.method.getText()).type;
		ctx.decl = checkMethod(ctx.method, ctx.expList(), null);
		ctx.dim = ctx.decl == null ? 0 : ctx.decl.dim;
		return ctx.decl == null ? Type.ERROR : ctx.decl.type;
	}

	@Override
	public Type visitCallExp(CallExpContext ctx) {
		ctx.callerType = visit(ctx.call_exp());
		ctx.decl = checkMethod(ctx.method, ctx.expList(), ctx.callerType);
		ctx.dim = ctx.decl == null ? 0 : ctx.decl.dim;
		return ctx.decl == null ? Type.ERROR : ctx.decl.type;
	}

	@Override
	public Type visitNewExp(NewExpContext ctx) {
		ctx.callerType = visit(ctx.dataType());
		ctx.dim = ctx.dataType().dim;
		return ctx.callerType;
	}

	@Override
	public Type visitArrayExp(ArrayExpContext ctx) {
		ctx.sym = sym.lookup(ctx.IDENT().getText());
		for(ExpContext expContext : ctx.exp()) {
			Type expType = visit(expContext);
			if(!expType.eq(Type.INT, expContext.dim, 0)) {
				new SemanticError(ctx.start).error("Array index must be int, got " + expType.name(expContext.dim));
			}
		}
		if(ctx.sym == null) { 
			new SemanticError(ctx.start).undefined("variable");
			ctx.dim = 0;
		} else {
			if(ctx.exp().size() > ctx.sym.decl.dim) {
				new SemanticError(ctx.start).error("Index size must be at most declared size");
				return Type.ERROR;
			}
			ctx.dim = ((VarDecl) (ctx.sym.decl)).dim - ctx.exp().size();
		}
		return ctx.sym.decl.type;
	}

	@Override
	public Type visitParenExp(ParenExpContext ctx) {
		Type type = visit(ctx.exp());
		ctx.dim = ctx.exp().dim;
		return type;
	}

	@Override
	public Type visitIdentExp(IdentExpContext ctx) {
		Symbol ident = sym.lookup(ctx.getText());
		ctx.sym = ident;
		if(ident == null || (ident.decl instanceof MethodDecl)) {
			ctx.dim = 0;
			new SemanticError(ctx.start).undefined("variable");
			return Type.ERROR;
		} else if(ident.decl instanceof ClassDecl) {
			ctx.dim = ident.decl.dim;
			return Type.INT;
		} else {
			ctx.dim = ident.decl.dim;
			return ident.decl.type;
		}
	}

	@Override
	public Type visitStringExp(StringExpContext ctx) {
		ctx.dim = 0;
		return Type.STRING;
	}

	@Override
	public Type visitIntExp(IntExpContext ctx) {
		ctx.dim = 0;
		return Type.INT;
	}

	@Override
	public Type visitTrueExp(TrueExpContext ctx) {
		ctx.dim = 0;
		return Type.BOOL;
	}

	@Override
	public Type visitFalseExp(FalseExpContext ctx) {
		ctx.dim = 0;
		return Type.BOOL;
	}

	@Override
	public Type visitNullExp(NullExpContext ctx) {
		ctx.dim = 0;
		return Type.NULL;
	}

	@Override
	public Type visitMeExp(MeExpContext ctx) {
		ctx.dim = 0;
		return curClassType;
	}
	
	//*************************************************************
	// Enter Expression Visitors
	//*************************************************************
	
	@Override
	public Type visitPrimaryEnter(PrimaryEnterContext ctx) {
		Type type = visit(ctx.primary_exp());
		ctx.dim = ctx.primary_exp().dim;
		return type;
	}

	@Override
	public Type visitAndEnter(AndEnterContext ctx) {
		Type type = visit(ctx.and_exp());
		ctx.dim = ctx.and_exp().dim;
		return type;
	}

	@Override
	public Type visitRelateEnter(RelateEnterContext ctx) {
		Type type = visit(ctx.relate_exp());
		ctx.dim = ctx.relate_exp().dim;
		return type;
	}

	@Override
	public Type visitBoolEnter(BoolEnterContext ctx) {
		Type type = visit(ctx.bool_exp());
		ctx.dim = ctx.bool_exp().dim;
		return type;
	}

	@Override
	public Type visitConcatEnter(ConcatEnterContext ctx) {
		Type type = visit(ctx.concat_exp());
		ctx.dim = ctx.concat_exp().dim;
		return type;
	}

	@Override
	public Type visitAddEnter(AddEnterContext ctx) {
		Type type = visit(ctx.add_exp());
		ctx.dim = ctx.add_exp().dim;
		return type;
	}

	@Override
	public Type visitMultEnter(MultEnterContext ctx) {
		Type type = visit(ctx.mult_exp());
		ctx.dim = ctx.mult_exp().dim;
		return type;
	}

	@Override
	public Type visitUnaryEnter(UnaryEnterContext ctx) {
		Type type = visit(ctx.unary_exp());
		ctx.dim = ctx.unary_exp().dim;
		return type;
	}

	@Override
	public Type visitArrayEnter(ArrayEnterContext ctx) {
		Type type = visit(ctx.array_exp());
		ctx.dim = ctx.array_exp().dim;
		return type;
	}
	
}
