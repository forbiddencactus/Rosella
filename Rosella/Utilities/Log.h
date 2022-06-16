#ifndef Rosella_Log
#define Rosella_Log 1

#include <stdarg.h>

namespace Rosella
{
    enum class PrintType: int
    {
        Error, 
        Warning, 
        Info
    };

    // Raw print. 
    void Print(PrintType type, const char* format, va_list argp);

    // Prints an error into the output. 
    inline void PrintError(const char *format, ...);
}

#endif