/* https://dev.to/evantypanski/writing-a-simple-programming-language-from-scratch-part-1-54a2 */

%{
    #include "Lexer/LexDef/Tokens.h"
    #include "AST/AST.h"
    #include "Platform/RosellaTypes.h"
    using namespace Rosella;
%}

%union{
  Int64 Int;
  Float64 Float;
  class ASTNodeBase *BaseNode;
  class ASTExpression *ExpressionNode;
  class ASTStatement *StatementNode;
  class ASTFunction *FunctionNode;
  class ASTObject *ObjectNode;
}

%define api.pure full
%define api.push-pull push
%start Object

/* Literals... */
%token <Int> LI_INTEGER
%token <Float> LI_FLOAT

/* Syntax tokens... */
%token SYN_LPAREN
%token SYN_RPAREN
%token SYN_LBRACE
%token SYN_RBRACE
%token SYN_SEMICOLON
%token SYN_COMMA
%token SYN_DOT
%token SYN_QUESTION
%token SYN_COLON

%type <ExpressionNode> Expression
%type <StatementNode> Statement
%type <FunctionNode> Function
%type <ObjectNode> Object
%left	OP_ARI_ADD OP_ARI_SUB
%left	OP_ARI_MUL OP_ARI_DIV

%%

Object: { object = new ASTObject(); }
    | Object Statement	{ assert(object); object->addStatement($2); }
    ;

/*
Function: 
    | Function 
*/

Statement: Expression SYN_SEMICOLON { $$ = new ASTStatement($1); }
    ;

Expression:
    LI_INTEGER	{ $$ = new ASTLiteralInteger($1); }
    | LI_FLOAT { $$ = new ASTLiteralFloat($1); }
    | SYN_LPAREN Expression SYN_RPAREN  { $$ = $2; }
	| Expression OP_ARI_ADD Expression	{ $$ = new ASTExpressionAdd($1, $3); }
	| Expression OP_ARI_SUB Expression	{ $$ = new ASTExpressionSub($1, $3); }
	| Expression OP_ARI_MUL Expression	{ $$ = new ASTExpressionMul($1, $3); }
	| Expression OP_ARI_DIV Expression	{ $$ = new ASTExpressionDiv($1, $3); }
    ;
%%
