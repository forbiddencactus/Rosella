 /* %option c++ */
%option header-file="RosellaFlexOutput.h"
%option outfile="RosellaFlexOutput.c"
%option noyywrap
%option reentrant
%option nounistd

%{
#define RETURN_TOKEN(_tok)	return _tok
#include "Lexer/Tokens.h"
%}

NEWLINE			[\n]
WSCHAR		    [ \t\f\v\r]
UNIV		    \\u{HEXDIGIT}{4}|\\U{HEXDIGIT}{8}
WHITESPACE	    {WSCHAR}+|({WSCHAR}*\\{NEWLINE})+{WSCHAR}*

DIGIT           [0-9]
IDENT		    [_a-zA-Z]([_a-zA-Z0-9]|{UNIV})*
NUMBER		    {DIGIT}+
FRACTIONAL	    ([0-9]+\.)|([0-9]*\.[0-9]+)

%%
{WHITESPACE}    { RETURN_TOKEN(TOK_WHITESPACE); }

 /* Logical operators... */
"&&"        { RETURN_TOKEN(OP_LOG_AND); }
"||"        { RETURN_TOKEN(OP_LOG_OR); }
"!"         { RETURN_TOKEN(OP_LOG_NOT); }

 /* Bitwise operators... */
"&"         { RETURN_TOKEN(OP_BIT_AND); }
"|"         { RETURN_TOKEN(OP_BIT_OR); }
"^"         { RETURN_TOKEN(OP_BIT_XOR); }
"<<"        { RETURN_TOKEN(OP_BIT_LEFTSHIFT); }
">>"        { RETURN_TOKEN(OP_BIT_RIGHTSHIFT); }
"~"         { RETURN_TOKEN(OP_BIT_NOT); }

 /* Arithmetic operators... */
"++"		{ RETURN_TOKEN(OP_ARI_INC); }
"--"		{ RETURN_TOKEN(OP_ARI_DEC); }
"*"		    { RETURN_TOKEN(OP_ARI_MUL); }
"/"		    { RETURN_TOKEN(OP_ARI_DIV); }
"+"		    { RETURN_TOKEN(OP_ARI_ADD); }
"-"		    { RETURN_TOKEN(OP_ARI_SUB); }
"%"		    { RETURN_TOKEN(OP_ARI_MOD); }

 /* Assignment operators... */
"="         { RETURN_TOKEN(OP_ASSIGN); }
"*="		{ RETURN_TOKEN(OP_ASSIGN_MUL); }
"/="		{ RETURN_TOKEN(OP_ASSIGN_DIV); }
"%="		{ RETURN_TOKEN(OP_ASSIGN_MOD); }
"+="		{ RETURN_TOKEN(OP_ASSIGN_ADD); }
"-="		{ RETURN_TOKEN(OP_ASSIGN_SUB); }
"&="        { RETURN_TOKEN(OP_ASSIGN_AND); }
"|="        { RETURN_TOKEN(OP_ASSIGN_OR); }
"^="        { RETURN_TOKEN(OP_ASSIGN_XOR); }
"<<="       { RETURN_TOKEN(OP_ASSIGN_LEFTSHIFT); }
">>="       { RETURN_TOKEN(OP_ASSIGN_RIGHTSHIFT); }

 /* Equality operators... */
"=="		{ RETURN_TOKEN(OP_EQ); }
"<"         { RETURN_TOKEN(OP_EQ_LESSTHAN); }
">"         { RETURN_TOKEN(OP_EQ_GREATERTHAN); }
"<="		{ RETURN_TOKEN(OP_EQ_LESSOREQUAL); }
">="		{ RETURN_TOKEN(OP_EQ_GREATEROREQUAL); }
"!="		{ RETURN_TOKEN(OP_EQ_NOTEQUAL); }

 /* Type specifier... */
void        { RETURN_TOKEN(TYPE_SPCF_VOID); }
int			{ RETURN_TOKEN(TYPE_SPCF_INT); }

 /* Type qualifier... */
let			{ RETURN_TOKEN(TYPE_QUAL_LET); }
var			{ RETURN_TOKEN(TYPE_QUAL_VAR); }

 /* Statements... */
return		{ RETURN_TOKEN(STA_RETURN); }
break       { RETURN_TOKEN(STA_BREAK); }
continue    { RETURN_TOKEN(STA_CONTINUE); }
func		{ RETURN_TOKEN(STA_FUNC); }
if          { RETURN_TOKEN(STA_IF); }
else        { RETURN_TOKEN(STA_ELSE); }
while       { RETURN_TOKEN(STA_WHILE); }
for         { RETURN_TOKEN(STA_FOR); }
do          { RETURN_TOKEN(STA_DO); }
switch      { RETURN_TOKEN(STA_SWITCH); }
case        { RETURN_TOKEN(STA_CASE); }
default     { RETURN_TOKEN(STA_DEFAULT); }

 /* Other syntax */
"("	        { RETURN_TOKEN(SYN_LPAREN); }
")"		    { RETURN_TOKEN(SYN_RPAREN); }
"{"		    { RETURN_TOKEN(SYN_LBRACE); }
"}"		    { RETURN_TOKEN(SYN_RBRACE); }
";"         { RETURN_TOKEN(SYN_SEMICOLON); }
","         { RETURN_TOKEN(SYN_COMMA); }
"."         { RETURN_TOKEN(SYN_DOT); }
"?"         { RETURN_TOKEN(SYN_QUESTION); }
":"         { RETURN_TOKEN(SYN_COLON); }



%%
