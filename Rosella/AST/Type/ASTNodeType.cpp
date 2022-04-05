#include "AST/Type/ASTNodeType.h"
using namespace Rosella;

ASTNodeType::ASTNodeType(RosellaToken token)
{
    Token = token;
}

ASTNodeType::ASTNodeType(ASTNodeIdent* identNode)
{
    Ident = identNode;
}

ASTNodeType* ASTNodeType::SetNullable(bool isNullable)
{
    Nullable = isNullable;
    return this;
}
