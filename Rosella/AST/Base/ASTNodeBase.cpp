#include "AST/Base/ASTNodeBase.h"
using namespace Rosella;

//extern int yylineno;

ASTNodeBase::ASTNodeBase()
{
    // TODO: Find a reentrant, thread safe version of this. 
    //LineNumber = yylineno;
}
