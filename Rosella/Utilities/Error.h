#ifndef Rosella_Error
#define Rosella_Error 1

namespace Rosella
{
    // Basic assert
    inline void Assert(bool condition);

    // Assert with an error message into the log.
    inline void AssertError(bool condition, const char *format, ...);

}

#endif