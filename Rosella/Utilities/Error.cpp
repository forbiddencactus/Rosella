#include "Utilities/Error.h"
#include "Utilities/Log.h"
#include <assert.h>
#include <stdarg.h>
namespace Rosella
{
    void Assert(bool condition)
    {
        assert(condition);
    }

    void AssertError(bool condition, const char *format, ...)
    {
        if(!condition)
        {    
                va_list argp;
                va_start(argp, format);
                Print(PrintType::Error, format, argp);
                va_end(argp);

                Assert(condition);
        }
    }
}
