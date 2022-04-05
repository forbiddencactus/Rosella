#ifndef Rosella_ASTNodeToken
#define Rosella_ASTNodeToken 1

#include "AST/Base/ASTNodeBase.h"

namespace Rosella
{
    class ASTNodeToken: ASTNodeBase
    {
        public:
        ASTNodeToken() {};
        ASTNodeToken(RosellaToken token);
        RosellaToken GetToken();

        protected:
        RosellaToken Token = TOK_NULL;
    };
}

#endif