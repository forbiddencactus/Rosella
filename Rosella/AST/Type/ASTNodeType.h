#ifndef Rosella_ASTNodeType
#define Rosella_ASTNodeType 1

#include "AST/Base/ASTNodeToken.h"

class ASTNodeIdent;

namespace Rosella
{
    class ASTNodeType: public ASTNodeToken
    {
        public:
        ASTNodeType(RosellaToken token);
        ASTNodeType(ASTNodeIdent* identNode);

        ASTNodeType* SetNullable(bool isNullable);
        ASTNodeType* SetLet(bool isLet);

        protected:
        ASTNodeIdent* Ident = nullptr;
        bool Nullable = false;
        bool Let = true;

    };
}



#endif