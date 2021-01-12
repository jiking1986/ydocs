#include <windows.h>

#include <string>

#define _L(x) __L(x)
#define __L(x) L##x

int main()
{
    std::wstring output = std::wstring(_L(__FILE__)) + std::wstring(L" ") + 
        std::wstring(_L(__FUNCTION__)) + std::wstring(L"()\r\n");
    OutputDebugStringW(output.c_str());
    return 0;
}
