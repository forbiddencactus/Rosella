#ifndef Rosella_ASTBase
#define Rosella_ASTBase 1

#include "Platform/RosellaTypes.h"
#include "Utilities/Utilities.h"
#include "Lexer/Tokens.h"

namespace Rosella
{
    class ASTNodeBase
    {
        public:
        ASTNodeBase();

        // Returns true if this AST instance is of the specified class. Otherwise, false. 
        template<class ASTClass>
        bool IsA();

        // Returns this node as the specified AST class, otherwise, it asserts, and returns nullptr. 
        template<class ASTClass>
        ASTClass* As();

        private:
        Float32 LineNumber = 0;
    };

    template<class ASTClass>
    bool ASTNodeBase::IsA()
    {
        if(dynamic_cast<ASTClass*>(this) != nullptr)
        {
            return true;
        }

        return false;
    }

    template<class ASTClass>
    ASTClass* ASTNodeBase::As()
    {
        ASTClass* returnPtr = dynamic_cast<ASTClass*>(this);
        AssertError( returnPtr != nullptr, "%s", "Cannot cast to the specified type!");
        return returnPtr;
    }

}

#endif