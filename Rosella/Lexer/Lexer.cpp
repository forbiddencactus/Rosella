#include "Lexer/Lexer.h"
#include "Lexer/TokenData.h"

// Hack because some versions of flex still emit unistd despite the "%option nounistd" option.
#ifndef YY_NO_UNISTD_H
#define YY_NO_UNISTD_H
#endif

extern "C"
{
#include "Lexer/LexDef/RosellaFlexOutput.h"
}

using namespace Rosella;

Lexer::Lexer()
{
    yylex_init((yyscan_t*)&this->yyscanner);
}

Lexer::~Lexer()
{
    yylex_destroy((yyscan_t)this->yyscanner);
}

bool Lexer::SetFile(const char* filePath)
{
    if(currentFile != nullptr) { return false; }
    currentFile = fopen(filePath, "r");

    yyset_in(currentFile, (yyscan_t)this->yyscanner);

    return true;
}

bool Lexer::Lex( TokenData& inTokenData )
{
    RosellaToken token = (RosellaToken)yylex((yyscan_t)this->yyscanner);

    if(token == TOK_EOF)
    {
        return false;
    }

    inTokenData.token = token;
    inTokenData.lineNo = yyget_lineno( (yyscan_t)this->yyscanner );
    if(token == TOK_IDENT)
    {
        inTokenData.stringVal = yyget_text( (yyscan_t)this->yyscanner );
    }

    if(token == LI_FLOAT)
    {
        inTokenData.floatVal = atof( yyget_text( (yyscan_t)this->yyscanner ));
    }

    if(token == LI_INTEGER)
    {
        inTokenData.intVal = atoi( yyget_text( (yyscan_t)this->yyscanner ));
    }

    return true;
}