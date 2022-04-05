#include "AST/Base/ASTNodeToken.h"
using namespace Rosella;

ASTNodeToken::ASTNodeToken(RosellaToken token)
{
    Token = token;
}

RosellaToken ASTNodeToken::GetToken()
{
    return Token;
}