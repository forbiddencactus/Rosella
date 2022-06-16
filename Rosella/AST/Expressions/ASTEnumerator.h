#ifndef Rosella_ASTEnumerator
#define Rosella_ASTEnumerator 1

#include "AST/Base/ASTNodeIdent.h"


namespace Rosella
{
    class ASTExpression;

    class ASTEnumerator: public ASTNodeIdent
    {
        public:
        ASTEnumerator(const char* identString, ASTExpression* expression);

        ASTExpression* expression;
    };
}

#endif