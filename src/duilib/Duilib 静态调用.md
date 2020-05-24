# Duilib 静态编译

---

### 下载
* https://github.com/duilib/duilib.git

### 编译
1. duilib\DuiLib\DuiLib_Static.vcxproj
* out:
 * duilib\DuiLib\Build\Debug_u\DuiLib_Static_ud.lib
 * duilib\DuiLib\Build\Release_u\DuiLib_Static_u.lib

### 调用
1. #define UILIB_STATIC
* Runtime Library: MD->MT(MDd->MTd)

### 测试代码
```
#define UILIB_STATIC

#ifdef _DEBUG
#pragma comment(lib, "DuiLib_Static_ud")
#else
#pragma comment(lib, "DuiLib_Static_u")
#endif

#include <Windows.h>

#include "UIlib.h"

using namespace DuiLib;

class CDuiFrameWnd : public CWindowWnd, public INotifyUI
{
public:
    virtual LPCTSTR GetWindowClassName() const { return _T("DUIMainFrame"); }
    virtual void    Notify(TNotifyUI& msg) {}

    virtual LRESULT HandleMessage(UINT uMsg, WPARAM wParam, LPARAM lParam)
    {
        LRESULT lRes = 0;

        if (uMsg == WM_CREATE)
        {
            CControlUI *pWnd = new CButtonUI;
            pWnd->SetText(_T("Hello World"));   // 设置文字
            pWnd->SetBkColor(0xFF00FF00);       // 设置背景色

            m_PaintManager.Init(m_hWnd);
            m_PaintManager.AttachDialog(pWnd);
            return lRes;
        }

        if (m_PaintManager.MessageHandler(uMsg, wParam, lParam, lRes))
        {
            return lRes;
        }

        return __super::HandleMessage(uMsg, wParam, lParam);
    }

protected:
    CPaintManagerUI m_PaintManager;
};

int APIENTRY _tWinMain(_In_ HINSTANCE hInstance,
    _In_opt_ HINSTANCE hPrevInstance,
    _In_ LPTSTR    lpCmdLine,
    _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    CPaintManagerUI::SetInstance(hInstance);

    CDuiFrameWnd duiFrame;
    duiFrame.Create(NULL, _T("DUIWnd"), UI_WNDSTYLE_FRAME, WS_EX_WINDOWEDGE);
    duiFrame.ShowModal();
    return 0;
}

```
