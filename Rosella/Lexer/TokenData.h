#ifndef Rosella_TokenData
#define Rosella_TokenData 1

#include "Lexer/Tokens.h"
#include "Platform/RosellaTypes.h"
#include <string>


namespace Rosella
{
    struct TokenData
    {    
        RosellaToken token = TOK_NULL;
        Int32 lineNo = 0;

        std::string stringVal;
        Float64 floatVal = 0;
        Int64 intVal = 0;
    };
}
#endif