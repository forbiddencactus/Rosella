#include "Lexer/Lexer.h"

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
    yylex_init(&this->scanner);
}

Lexer::~Lexer()
{
    yylex_destroy(this->scanner);
}

bool Lexer::SetFile(const char* filePath)
{
    if(currentFile != nullptr) { return false; }
    currentFile = fopen(filePath, "r");

    yyset_in(currentFile, scanner);

    return true;
}