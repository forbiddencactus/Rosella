#include "Utilities/Log.h"
#include <stdio.h>
namespace Rosella
{
    void Print(PrintType type, const char* format, va_list argp)
    {
        switch (type)
        {
            case PrintType::Error:
            {
                fprintf(stderr, "Error: ");
                vfprintf(stderr, format, argp);
                fprintf(stderr, "\n");
                break;
            }

            case PrintType::Warning:
            {
                fprintf(stdout, "Warning: ");
                vfprintf(stdout, format, argp);
                fprintf(stdout, "\n");
                break;
            }

            case PrintType::Info:
            {
                fprintf(stdout, "Info: ");
                vfprintf(stdout, format, argp);
                fprintf(stdout, "\n");
                break;
            }
        }
    }

    void PrintError(const char *format, ...)
    {
        va_list argp;
        va_start(argp, format);
        Print(PrintType::Error, format, argp);
        va_end(argp);
    }
}