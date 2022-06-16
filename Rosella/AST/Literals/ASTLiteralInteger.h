#ifndef Rosella_ASTNodeLiteralInteger
#define Rosella_ASTNodeLiteralInteger 1

#include "AST/Base/ASTNodeBase.h"

namespace Rosella
{
    class ASTLiteralInteger: public ASTNodeBase
    {
        public:
        ASTLiteralInteger(Int64 intVal);

        protected:
        Int64 Integer = 0;
    };
}

#endif