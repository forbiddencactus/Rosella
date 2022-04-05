#include "Lexer/Tokens.h"
extern "C"
{
    #include "stdio.h"
}

typedef void* yyscan_t;

namespace Rosella
{
    class Lexer
    {
        private:
        yyscan_t scanner;
        FILE* currentFile = nullptr;

        public:
        Lexer();
        ~Lexer();

        bool SetFile(const char* filePath);
    };
}