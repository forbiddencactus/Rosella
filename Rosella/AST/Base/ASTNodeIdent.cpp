#include "AST/Base/ASTNodeIdent.h"
using namespace Rosella;

// Constructs an ident node. 
ASTNodeIdent::ASTNodeIdent(const char* identString)
{
    Ident = identString;
}
        
// Returns the ident as a string. 
std::string ASTNodeIdent::GetIdentString()
{
    return Ident;
}