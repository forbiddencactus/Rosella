#include "AST/Expressions/ASTExpressionPrimary.h"
using namespace Rosella;

ASTExpressionPrimaryNumber::ASTExpressionPrimaryNumber(UInt64 number)
{
    Number = number;
}

ASTExpressionPrimaryIdentifier::ASTExpressionPrimaryIdentifier(const char* id)
{
    identifier = id;
}
