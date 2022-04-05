#ifndef Rosella_ASTOperatorUnary
#define Rosella_ASTOperatorUnary 1

#include "AST/Operators/ASTOperator.h"

namespace Rosella
{
    class ASTOperatorUnary: public ASTOperator
    {
        ASTOperatorUnary(RosellaToken token);
    };
}

#endif