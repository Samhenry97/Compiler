/*
 * File: Floyd.g4
 * Author: Sam Henry 
 * Date: January 22, 2018
 * Class: CpS 450, Compiler
 * Desc: The Floyd Grammar Definition
 */

grammar Floyd;

@header {
	package cps450; 
	import cps450.declarations.*;
} 

//***********************************************************************
// Grammar Definition
//***********************************************************************

start
	: NEWLINE* klass (cr klass)* NEWLINE*
	;

klass
	: KW_CLASS name=IDENT (KW_INHERITS KW_FROM inherit=IDENT)? KW_IS cr
	  varDecl*
	  methodDecl*
	  KW_END endName=IDENT
	;
	
varDecl returns [Symbol sym]
	: name=IDENT (COLON dataType)? (ASSIGN init=exp)? cr
	;
	
dataType returns [int dim]
	: dataType L_BRACK exp? R_BRACK #ArrayType
	| KW_INT #IntType 
	| KW_STRING #StringType 
	| KW_BOOL #BoolType 
	| IDENT #ClassType
	;

methodDecl returns [MethodDecl decl]
	: name=IDENT L_PAREN argDeclList? R_PAREN (COLON dataType)? KW_IS cr
	  varDecl*
	  KW_BEGIN cr
	  stmtList
	  KW_END endName=IDENT cr
	;
	
argDeclList
	: (args+=argDecl SEMI)* args+=argDecl
	;
	
argDecl returns [VarDecl decl]
	: name=IDENT COLON dataType
	;
	
stmtList
	: (stmts+=stmt cr)*
	;
	
stmt
	: assignStmt 
	| ifStmt 
	| loopStmt 
	| callStmt
	;
	
assignStmt returns [Symbol sym]
	: var=IDENT (L_BRACK arr+=exp R_BRACK)* ASSIGN value=exp
	;
	
ifStmt
	: KW_IF test=exp KW_THEN cr
	  good=stmtList
	  (KW_ELSE cr bad=stmtList)?
	  KW_END KW_IF
	;
	
loopStmt
	: KW_LOOP KW_WHILE test=exp cr
	  stmtList
	  KW_END KW_LOOP
	;
	
callStmt returns [Type callerType, MethodDecl decl]
	: (exp DOT)? method=IDENT L_PAREN (expList)? R_PAREN
	;
	
exp returns [Type type, int dim]
	: e1=exp op=KW_OR e2=and_exp #OrExp 
	| and_exp #AndEnter 
	;
	
and_exp returns [Type type, int dim]
	: e1=and_exp op=KW_AND e2=relate_exp #AndExp 
	| relate_exp #RelateEnter 
	;
	
relate_exp returns [Type type, int dim]
	: bool_exp #BoolEnter 
	| concat_exp #ConcatEnter 
	;
	
bool_exp returns [Type type, int dim]
	: e1=concat_exp op=(OP_GT | OP_GT_EQ | OP_EQ | OP_LT | OP_LT_EQ | OP_NE) e2=concat_exp #BoolExp
	;
	
concat_exp returns [Type type, int dim]
	: e1=concat_exp op=OP_CONCAT e2=add_exp #ConcatExp 
	| add_exp #AddEnter 
	;
	
add_exp returns [Type type, int dim]
	: e1=add_exp op=(OP_PLUS | OP_MINUS) e2=mult_exp #AddExp 
	| mult_exp #MultEnter 
	;
	
mult_exp returns [Type type, int dim]
	: e1=mult_exp op=(OP_TIMES | OP_DIVIDE) e2=unary_exp #MultExp 
	| unary_exp #UnaryEnter 
	;
	
unary_exp returns [int dim]
	: op=(OP_PLUS | OP_MINUS | KW_NOT)? call_exp #UnaryExp
	;
	
call_exp returns [Type callerType, MethodDecl decl, int dim]
	: KW_NEW dataType #NewExp 
	| method=IDENT L_PAREN expList? R_PAREN #CallBasicExp 
	| call_exp DOT method=IDENT L_PAREN expList? R_PAREN #CallExp 
	| array_exp #ArrayEnter 
	;
	
array_exp returns [Symbol sym, int dim]
	: IDENT (L_BRACK exp R_BRACK)+ #ArrayExp 
	| primary_exp #PrimaryEnter 
	;
	
primary_exp returns [Symbol sym, int dim]
	: L_PAREN exp R_PAREN #ParenExp 
	| IDENT #IdentExp 
	| STRING_LIT #StringExp 
	| INT_LIT  #IntExp 
	| KW_TRUE #TrueExp 
	| KW_FALSE #FalseExp 
	| KW_NULL #NullExp 
	| KW_ME #MeExp
	;
	
expList
	: exps+=exp (COMMA exps+=exp)*
	;
	
cr
	: NEWLINE+
	;




//***********************************************************************
// Token Definitions 
//***********************************************************************

// Common Fragments
fragment DIGIT
	: ('0' .. '9')
	;
	
fragment OCT_DIGIT
	: ('0' .. '7')
	;
	
fragment CHAR
	: ('a' .. 'z') 
	| ('A' .. 'Z')
	;

fragment VALID_ID_START
	: CHAR 
	| '_' 
	;
	
fragment VALID_ID_CHAR
	: VALID_ID_START 
	| DIGIT 
	;

// Keywords
KW_AND: 'and';
KW_BOOL: 'boolean';
KW_BEGIN: 'begin';
KW_CLASS: 'class';
KW_ELSE: 'else';
KW_END: 'end';
KW_FALSE: 'false';
KW_FROM: 'from';
KW_IF: 'if';
KW_INHERITS: 'inherits';
KW_INT: 'int';
KW_IS: 'is';
KW_LOOP: 'loop';
KW_ME: 'me';
KW_NEW: 'new';
KW_NOT: 'not';
KW_NULL: 'null';
KW_OR: 'or';
KW_STRING: 'string';
KW_THEN: 'then';
KW_TRUE: 'true';
KW_WHILE: 'while';

// Operators
OP_CONCAT: '&';
OP_PLUS: '+';
OP_MINUS: '-';
OP_TIMES: '*';
OP_DIVIDE: '/';
OP_GT: '>';
OP_GT_EQ: '>=';
OP_EQ: '=';
OP_LT: '<';
OP_LT_EQ: '<=';
OP_NE: '!=';

// Other
ASSIGN: ':=';
L_PAREN: '(';
R_PAREN: ')';
L_BRACK: '[';
R_BRACK: ']';
COMMA: ',';
SEMI: ';';
COLON: ':';
DOT: '.';

IDENT
	: VALID_ID_START VALID_ID_CHAR* 
	;

INT_LIT
	: '-'? DIGIT+ 
	;

fragment ESC_TAB: '\\t' ;
fragment ESC_NEWLINE: '\\n' ;
fragment ESC_FORM: '\\f' ;
fragment ESC_CR: '\\r' ;
fragment ESC_DOUBLE: '\\"' ;
fragment ESC_BACK: '\\\\' ;
fragment ESC_OCT: '\\' OCT_DIGIT OCT_DIGIT OCT_DIGIT ;
fragment ESCAPE
	: ESC_TAB 
	| ESC_NEWLINE 
	| ESC_FORM 
	| ESC_CR 
	| ESC_DOUBLE 
	| ESC_BACK 
	| ESC_OCT
	;

STRING_LIT
	: '"' (ESCAPE | ~["\n\r\\])* '"' 
	;

LINE_CONTINUATION
	: '_' '\r'? '\n' -> skip
	;

NEWLINE
	: '\r'? '\n' 
	;

COMMENT
	: '~' ~[\r\n]* -> skip 
	;

WHITESPACE
	: [ \t]+ -> skip 
	;

ERR_ILLEGAL_STRING
	: '"' (ESCAPE | ~["\n\r])* '"' 
	;

ERR_UNTERMINATED_STRING
	: '"' (ESCAPE | ~["\n\r\\])* 
	;

ERR_UNRECOGNIZED
	: .
	;