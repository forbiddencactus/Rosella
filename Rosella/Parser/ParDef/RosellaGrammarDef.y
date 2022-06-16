// https://www.codeproject.com/script/Articles/ViewDownloads.aspx?aid=1056460
%token_type { ASTBase* }
%name RosellaParser

// Operator precedence... 
//%left AND.
//%left OR.
%nonassoc OP_EQ OP_EQ_LESSTHAN OP_EQ_GREATERTHAN OP_EQ_LESSOREQUAL OP_EQ_GREATEROREQUAL OP_EQ_NOTEQUAL.
%left OP_ARI_ADD OP_ARI_SUB.
%left OP_ARI_DIV OP_ASSIGN_MUL OP_ASSIGN_MOD.

%include 
{
    #include "Lexer/LexDef/Tokens.h"
    #include "AST/AST.h"

    using namespace Rosella;
}

program ::= external_declaration_list. {  }

// Unary operators...
unary_operator(A) ::= OP_LOG_AND. { A = new ASTOperatorUnary(OP_LOG_AND); }
unary_operator(A) ::= OP_ARI_MUL. { A = new ASTOperatorUnary(OP_ARI_MUL); }
unary_operator(A) ::= OP_ARI_ADD. { A = new ASTOperatorUnary(OP_ARI_ADD); }
unary_operator(A) ::= OP_ARI_SUB. { A = new ASTOperatorUnary(OP_ARI_SUB); }
unary_operator(A) ::= OP_ARI_DIV. { A = new ASTOperatorUnary(OP_ARI_DIV); }
unary_operator(A) ::= OP_LOG_NOT. { A = new ASTOperatorUnary(OP_LOG_NOT); }

// Assignment operators...
assignment_operator(A) ::= OP_ASSIGN.               { A = new ASTOperatorAssignment(OP_ASSIGN); }
assignment_operator(A) ::= OP_ASSIGN_MUL.           { A = new ASTOperatorAssignment(OP_ASSIGN_MUL); }
assignment_operator(A) ::= OP_ASSIGN_DIV.           { A = new ASTOperatorAssignment(OP_ASSIGN_DIV); }
assignment_operator(A) ::= OP_ASSIGN_MOD.           { A = new ASTOperatorAssignment(OP_ASSIGN_MOD); }
assignment_operator(A) ::= OP_ASSIGN_ADD.           { A = new ASTOperatorAssignment(OP_ASSIGN_ADD); }
assignment_operator(A) ::= OP_ASSIGN_SUB.           { A = new ASTOperatorAssignment(OP_ASSIGN_SUB); }
assignment_operator(A) ::= OP_ASSIGN_LEFTSHIFT.     { A = new ASTOperatorAssignment(OP_ASSIGN_LEFTSHIFT); }
assignment_operator(A) ::= OP_ASSIGN_RIGHTSHIFT.    { A = new ASTOperatorAssignment(OP_ASSIGN_RIGHTSHIFT); }
assignment_operator(A) ::= OP_ASSIGN_AND.           { A = new ASTOperatorAssignment(OP_ASSIGN_AND); }
assignment_operator(A) ::= OP_ASSIGN_XOR.           { A = new ASTOperatorAssignment(OP_ASSIGN_XOR); }
assignment_operator(A) ::= OP_ASSIGN_OR.            { A = new ASTOperatorAssignment(OP_ASSIGN_OR); }

// Ident node...
ident_node(A) ::= IDENT(B). { A = new ASTNodeIdent(B); }

// Enumerator...
// enumerator(A) ::= ident_node(B). { A = B; }                       
// enumerator(A) ::= IDENT(B) OP_ASSIGN constant_expression(C). { A = new ASTEnumerator(B, C); }

// Enumerator list...
// enumerator_list ::= enumerator.
// enumerator_list ::= enumerator_list SYN_COMMA enumerator.

// ENUM SPECIFIER
// enum_specifier ::= ENUM NAME LBRACE enumerator_list RBRACE.
// enum_specifier ::= ENUM LBRACE enumerator_list RBRACE.
// enum_specifier ::= ENUM NAME.

// STRUCT OR UNION
// struct_or_union ::= STRUCT.
// struct_or_union ::= UNION.

// Constant expression...
constant_expression(A) ::= conditional_expression(B). { A = B; }

// STRUCT DECLARATOR
// struct_declarator ::= declarator.
// struct_declarator ::= COLON constant_expression.
// struct_declarator ::= declarator COLON constant_expression.

// STRUCT DECLARATOR LIST
// struct_declarator_list ::= struct_declarator.
// struct_declarator_list ::= struct_declarator_list COMMA struct_declarator.

// STRUCT DECLARATION
// struct_declaration ::= specifier_qualifier_list struct_declarator_list SEMICOLON.

// STRUCT DECLARATION LIST
// struct_declaration_list ::= struct_declaration.
// struct_declaration_list ::= struct_declaration_list struct_declaration.

// STRUCT OR UNION SPECIFIER
// struct_or_union_specifier ::= struct_or_union NAME LBRACE struct_declaration_list RBRACE.
// struct_or_union_specifier ::= struct_or_union LBRACE struct_declaration_list RBRACE.
// struct_or_union_specifier ::= struct_or_union NAME.

// Type name...
type_name(A) ::= ident_node(B).     { A = new ASTNodeType(B); }
type_name(A) ::= TYPE_SPCF_VOID.    { A = new ASTNodeType(TYPE_SPCF_VOID); }
type_name(A) ::= TYPE_SPCF_INT.     { A = new ASTNodeTypeName(TYPE_SPCF_INT); }

// Type specifier..
type_specifier(A) ::= type_name(B).                 { A = B; } 
type_specifier(A) ::= type_name(B) SYN_QUESTION.    { A = B->As<ASTNodeType>->SetNullable(true); }

// Type declaration...
type_declaration(A) ::= TYPE_QUAL_LET type_specifier(B). { A = B;}
type_declaration(A) ::= TYPE_QUAL_VAR type_specifier(B). { A = B->As<ASTNodeType>->SetLet(false);}

// Argument expression list...
argument_expression_list(A) ::= assignment_expression(B). { A = B; }
argument_expression_list(A) ::= argument_expression_list(B) SYN_COMMA assignment_expression(C). { A = ASTNodeList::CreateOrAddToList<ASTExpressionArgumentList>(B, C);}

// Primary expression...
primary_expression(A) ::= IDENT(B). { A = new ASTExpressionPrimaryIdentifier(B); }
primary_expression(A) ::= NUMBER(B). { A = new ASTExpressionPrimaryNumber(B); }
//primary_expression ::= CHARACTER.
//primary_expression ::= FLOATING.
//primary_expression ::= STRING_LITERAL.
primary_expression(A) ::= SYN_LPAREN expression(B) SYN_RPAREN. { A = B; }

// Postfix expression...
postfix_expression ::= primary_expression. { A = B; }
postfix_expression ::= postfix_expression SYN_LBRACE expression SYN_RBRACE.
postfix_expression ::= postfix_expression SYN_LPAREN argument_expression_list SYN_RPAREN.
postfix_expression ::= postfix_expression SYN_LPAREN SYN_RPAREN.
postfix_expression ::= postfix_expression SYN_DOT IDENT.
postfix_expression ::= postfix_expression OP_ARI_INC.
postfix_expression ::= postfix_expression OP_ARI_DEC.

// Unary expression...
unary_expression ::= postfix_expression.
unary_expression ::= OP_ARI_INC unary_expression.
unary_expression ::= OP_ARI_DEC unary_expression.
unary_expression ::= unary_operator cast_expression.
// unary_expression ::= SIZEOF unary_expression.
// unary_expression ::= SIZEOF LPAREN type_name RPAREN.

// Cast expression...
cast_expression ::= unary_expression.
cast_expression ::= SYN_LPAREN type_declaration SYN_RPAREN cast_expression.

// Multiplicative expression...
multiplicative_expression ::= cast_expression.
multiplicative_expression ::= multiplicative_expression OP_ARI_MUL cast_expression.
multiplicative_expression ::= multiplicative_expression OP_ARI_DIV cast_expression.
multiplicative_expression ::= multiplicative_expression OP_ARI_MOD cast_expression.

// Additive expression...
additive_expression ::= multiplicative_expression.
additive_expression ::= additive_expression OP_ARI_ADD multiplicative_expression.
additive_expression ::= additive_expression OP_ARI_SUB multiplicative_expression.

// Shift expression...
shift_expression ::= additive_expression.
shift_expression ::= shift_expression OP_BIT_LEFTSHIFT additive_expression.
shift_expression ::= shift_expression OP_BIT_RIGHTSHIFT additive_expression.

// Relational expression...
relational_expression ::= shift_expression.
relational_expression ::= relational_expression OP_EQ_LESSTHAN shift_expression.
relational_expression ::= relational_expression OP_EQ_GREATERTHAN shift_expression.
relational_expression ::= relational_expression OP_EQ_LESSOREQUAL shift_expression.
relational_expression ::= relational_expression OP_EQ_GREATEROREQUAL shift_expression.

// Equality expression...
equality_expression ::= relational_expression.
equality_expression ::= equality_expression OP_EQ relational_expression.
equality_expression ::= equality_expression OP_EQ_NOTEQUAL relational_expression.

// And expression...
and_expression ::= equality_expression.
and_expression ::= and_expression OP_BIT_AND equality_expression.

// Exclusive or...
exclusive_or_expression ::= and_expression.
exclusive_or_expression ::= exclusive_or_expression OP_BIT_XOR and_expression.

// Inclusive or...
inclusive_or_expression ::= exclusive_or_expression.
inclusive_or_expression ::= inclusive_or_expression OP_BIT_OR exclusive_or_expression.

// Logical and...
logical_and_expression ::= inclusive_or_expression.
logical_and_expression ::= logical_and_expression OP_LOG_AND inclusive_or_expression.

// Logical or...
logical_or_expression ::= logical_and_expression.
logical_or_expression ::= logical_or_expression OP_LOG_OR logical_and_expression.

// Conditional expression...
conditional_expression ::=    logical_or_expression.
conditional_expression ::=    logical_or_expression SYN_QUESTION expression SYN_COLON conditional_expression.

// Assignment expression...
assignment_expression ::= conditional_expression.
assignment_expression ::= unary_expression assignment_operator assignment_expression.

// Expression...
expression ::= assignment_expression.
expression ::= expression SYN_COMMA assignment_expression.

// Jump statements...
// jump_statement ::= GOTO NAME SYN_SEMICOLON.
jump_statement ::= STA_CONTINUE SYN_SEMICOLON.
jump_statement ::= STA_BREAK SYN_SEMICOLON.
jump_statement ::= STA_RETURN SYN_SEMICOLON.
jump_statement ::= STA_RETURN expression SYN_SEMICOLON.

// Iteration statements...
iteration_statement ::= STA_WHILE SYN_LPAREN expression SYN_RPAREN statement.
iteration_statement ::= STA_DO statement STA_WHILE SYN_LPAREN expression SYN_RPAREN SYN_SEMICOLON.
iteration_statement ::= STA_FOR SYN_LPAREN expression SYN_SEMICOLON expression SEMICOLON expression SYN_RPAREN statement.

// Selection statements...
selection_statement ::= STA_IF SYN_LPAREN expression SYN_RPAREN statement.
//selection_statement ::= STA_IF SYN_LPAREN expression SYN_RPAREN statement STA_ELSE statement.
selection_statement ::= STA_SWITCH SYN_LPAREN expression SYN_RPAREN statement.

// Expression statement...
expression_statement ::= expression SYN_SEMICOLON.
expression_statement ::= SYN_SEMICOLON.

// Labelled statement... 
labeled_statement ::= IDENT SYN_COLON statement.
labeled_statement ::= STA_CASE constant_expression SYN_COLON statement.
labeled_statement ::= STA_DEFAULT SYN_COLON statement.

// Statement...
statement ::= labeled_statement.
statement ::= code_block.
statement ::= expression_statement.
statement ::= selection_statement.
statement ::= iteration_statement.
statement ::= jump_statement.

// Statment list...
statement_list ::= statement.
statement_list ::= statement_list statement.

// Declaration list...
declaration_list ::= declaration.
declaration_list ::= declaration_list declaration.

// Code block...
code_block ::= SYN_LBRACE SYN_RBRACE.
code_block ::= SYN_LBRACE statement_list SYN_RBRACE.
code_block ::= SYN_LBRACE declaration_list SYN_RBRACE.
code_block ::= SYN_LBRACE declaration_list statement_list SYN_RBRACE.

// Identifier list...
identifier_list ::= IDENT.
identifier_list ::= identifier_list SYN_COMMA IDENT.

// Storage class specifier...
// storage_class_specifier ::= TYPEDEF.
// storage_class_specifier ::= EXTERN.
// storage_class_specifier ::= STATIC.
// storage_class_specifier ::= AUTO.
// storage_class_specifier ::= REGISTER.

// Declaration specifier...
// Alex note... something like class declarations are declaration specifiers, for instance.
// declaration_specifiers ::= storage_class_specifier.
// declaration_specifiers ::= storage_class_specifier declaration_specifiers.
// declaration_specifiers ::= type_specifier.
// declaration_specifiers ::= type_specifier declaration_specifiers.
// declaration_specifiers ::= type_qualifier.
declaration_specifiers ::= type_declaration.

// Parameter declaration...
parameter_declaration ::= declaration_specifiers.
parameter_declaration ::= declaration_specifiers declarator.
parameter_declaration ::= declaration_specifiers abstract_declarator.

// Parameter list...
parameter_list ::= parameter_declaration.
parameter_list ::= parameter_list SYN_COMMA parameter_declaration.

// Initialiser...
initialiser ::= assignment_expression.
initialiser ::= SYN_LBRACE initialiser_list SYN_RBRACE.
initialiser ::= SYN_LBRACE initialiser_list SYN_COMMA SYN_RBRACE.

// Initialiser list...
initialiser_list ::= initialiser.
initialiser_list ::= initialiser_list SYN_COMMA initialiser.

// Direct Declarator...
// direct_declarator ::= IDENT. 
direct_declarator ::= direct_declarator SYN_LBRACKET constant_expression SYN_RBRACKET.
direct_declarator ::= direct_declarator SYN_LBRACKET SYN_RBRACKET.
direct_declarator ::= direct_declarator SYN_LPAREN parameter_list SYN_RPAREN.
direct_declarator ::= direct_declarator SYN_LPAREN identifier_list SYN_RPAREN.
direct_declarator ::= direct_declarator SYN_LPAREN SYN_RPAREN. 

// Declarator...
declarator ::= direct_declarator.

// Init declarator...
init_declarator ::= declarator.
init_declarator ::= declarator OP_ASSIGN initialiser.

// Init declarator list...
init_declarator_list ::= init_declarator.
init_declarator_list ::= init_declarator_list SYN_COMMA init_declarator.

// Declaration...
declaration ::= declaration_specifiers SYN_SEMICOLON.
declaration ::= declaration_specifiers init_declarator_list SYN_SEMICOLON.

// Function definition...
function_definition ::= declaration_specifiers declarator declaration_list code_block.
function_definition ::= declaration_specifiers declarator code_block.
function_definition ::= declarator declaration_list code_block.
function_definition ::= declarator code_block.

// External declaration...
external_declaration ::= function_definition. // { pCount->numFunctionDefinitions++; }
external_declaration ::= declaration. // { pCount->numVariableDeclarations++; }

// External declaration list...
external_declaration_list ::= external_declaration.
external_declaration_list ::= external_declaration_list external_declaration.
