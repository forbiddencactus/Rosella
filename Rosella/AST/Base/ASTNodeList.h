#ifndef Rosella_ASTNodeList
#define Rosella_ASTNodeList 1

#include "AST/Base/ASTNodeBase.h"
#include <vector>

namespace Rosella
{
    class ASTNodeList: ASTNodeBase
    {
        public:
        std::vector<ASTNodeBase*> nodeList;
    };
}

#endif