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

%start Object

%token <Int> LI_INTEGER
%token <Float> LI_FLOAT
%token SYN_SEMICOLON
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
	| exp OP_ARI_ADD exp	{ $$ = new ASTExpressionAdd($1, $3); }
	| exp OP_ARI_SUB exp	{ $$ = new ASTExpressionSub($1, $3); }
	| exp OP_ARI_MUL exp	{ $$ = new ASTExpressionMul($1, $3); }
	| exp OP_ARI_DIV exp	{ $$ = new ASTExpressionDiv($1, $3); }
    ;
%%
