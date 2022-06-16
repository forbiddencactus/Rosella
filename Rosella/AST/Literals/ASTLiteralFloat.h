#ifndef Rosella_ASTNodeLiteralFloat
#define Rosella_ASTNodeLiteralFloat 1

#include "AST/Base/ASTNodeBase.h"

namespace Rosella
{
    class ASTLiteralFloat: public ASTNodeBase
    {
        public:
        ASTLiteralFloat(Float64 floatVal);

        protected:
        Float64 Float = 0;
    };
}

#endif