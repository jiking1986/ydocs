#include <windows.h>
#include <Shlobj.h>
#include <tchar.h>

int main()
{
    BOOL ret = FALSE;
    TCHAR szPublicDesktop[2 * MAX_PATH] = { 0 }, szDesktop[2 * MAX_PATH] = { 0 };

    ret = SHGetSpecialFolderPath(NULL, szPublicDesktop, CSIDL_COMMON_DESKTOPDIRECTORY, FALSE);
    ret = SHGetSpecialFolderPath(NULL, szDesktop, CSIDL_DESKTOPDIRECTORY, FALSE);

    _tprintf(L"Public Desktop: %s\r\n", szPublicDesktop);
    _tprintf(L"User Desktop: %s\r\n", szDesktop);

    system("pause");

    return ret;
}
