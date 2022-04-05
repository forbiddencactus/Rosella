#ifndef Rosella_ASTNodeIdent
#define Rosella_ASTNodeIdent 1

#include "AST/Base/ASTNodeBase.h"
#include <string>

namespace Rosella
{
    class ASTNodeIdent: ASTNodeBase
    {
        public:
        
        // Constructs an ident node. 
        ASTNodeIdent(const char* identString);
        
        // Returns the ident as a string. 
        std::string GetIdentString();

        protected:
        std::string Ident = "";
    };
}

#endif