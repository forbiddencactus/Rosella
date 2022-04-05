#ifndef Rosella_Tokens
#define Rosella_Tokens 1

typedef enum rosellaToken
{
TOK_WHITESPACE = 0,

// Logical operators...
OP_LOG_AND,
OP_LOG_OR,
OP_LOG_NOT,

// Bitwise operators...
OP_BIT_AND,
OP_BIT_OR,
OP_BIT_XOR,
OP_BIT_LEFTSHIFT,
OP_BIT_RIGHTSHIFT,
OP_BIT_NOT,

// Arithmetic operators... 
OP_ARI_INC,
OP_ARI_DEC,
OP_ARI_MUL,
OP_ARI_DIV,
OP_ARI_ADD,
OP_ARI_SUB,
OP_ARI_MOD,
 
// Assignment operators...
OP_ASSIGN,
OP_ASSIGN_MUL,
OP_ASSIGN_DIV,
OP_ASSIGN_MOD,
OP_ASSIGN_ADD,
OP_ASSIGN_SUB,
OP_ASSIGN_AND,
OP_ASSIGN_OR,
OP_ASSIGN_XOR,
OP_ASSIGN_LEFTSHIFT,
OP_ASSIGN_RIGHTSHIFT,

// Equality operators...
OP_EQ,
OP_EQ_LESSTHAN,
OP_EQ_GREATERTHAN,
OP_EQ_LESSOREQUAL,
OP_EQ_GREATEROREQUAL,
OP_EQ_NOTEQUAL,

// Type specifiers...
TYPE_SPCF_VOID,
TYPE_SPCF_INT,

// Type qualifiers...
TYPE_QUAL_LET,
TYPE_QUAL_VAR,

// Statements... 
STA_RETURN,
STA_BREAK,
STA_CONTINUE,
STA_FUNC,
STA_IF,
STA_ELSE,
STA_WHILE,
STA_FOR,
STA_DO,
STA_SWITCH,
STA_CASE,
STA_DEFAULT,

// Other syntax...
SYN_LPAREN,
SYN_RPAREN,
SYN_LBRACE,
SYN_RBRACE, 
SYN_SEMICOLON,
SYN_COMMA,
SYN_DOT,
SYN_QUESTION,
SYN_COLON,

// End token. 
TOK_END_TOKEN, 

// Null token.
TOK_NULL
} RosellaToken;

#endif