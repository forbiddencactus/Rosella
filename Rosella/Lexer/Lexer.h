#ifndef Rosella_Lexer
#define Rosella_Lexer 1

extern "C"
{
    #include "stdio.h"
}

namespace Rosella
{
    struct TokenData;

    class Lexer
    {
        private:
        void* yyscanner;
        FILE* currentFile = nullptr;

        public:
        Lexer();
        ~Lexer();

        // Sets the file that will be lexed by this lexer. 
        bool SetFile(const char* filePath);

        // Scans tokens and sets the provided inToken to the found token if a token is found. Returns false at EOF. 
        bool Lex( TokenData& inTokenData );
    };
}

#endif