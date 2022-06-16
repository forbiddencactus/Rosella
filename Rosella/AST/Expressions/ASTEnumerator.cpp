#include "AST/Expressions/ASTEnumerator.h"
using namespace Rosella;

ASTEnumerator::ASTEnumerator(const char* identString, ASTExpression* expression) : ASTNodeIdent(identString)
{
    this->expression = expression;
}