#ifndef Rosella_ASTOperatorAssignment
#define Rosella_ASTOperatorAssignment 1

#include "AST/Operators/ASTOperator.h"

namespace Rosella
{
    class ASTOperatorAssignment: public ASTOperator
    {
        ASTOperatorAssignment(RosellaToken token);
    };
}

#endif