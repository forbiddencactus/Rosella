#include "AST/Base/ASTNodeBase.h"
using namespace Rosella;

ASTNodeBase* ASTNodeBase::GetParent()
{
    return Parent;
}

void ASTNodeBase::SetParent(ASTNodeBase* parent)
{
    Parent = parent;
}
