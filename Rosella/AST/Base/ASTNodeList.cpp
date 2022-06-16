#include "AST/Base/ASTNodeList.h"
using namespace Rosella;

void ASTNodeList::AddToList(ASTNodeBase* element)
{
    nodeList.push_back(element);
}
