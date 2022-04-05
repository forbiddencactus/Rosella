#ifndef Rosella_ASTExpressionPrimary
#define Rosella_ASTExpressionPrimary 1

#include "AST/Expressions/ASTExpression.h"

namespace Rosella
{
    class ASTExpressionPrimary: ASTExpression
    {

    };

    class ASTExpressionPrimaryNumber: ASTExpressionPrimary
    {
        public:
        UInt64 Number;

        ASTExpressionPrimaryNumber(UInt64 number);
    };

    class ASTExpressionPrimaryIdentifier: ASTExpressionPrimary
    {
        public:
        const char* identifier;

        ASTExpressionPrimaryIdentifier(const char* id);
    };

}

#endif