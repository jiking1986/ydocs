
---
### vs properties

General->Character Set->Use Multi-Byte Character Set

C/C++->General->Additional Include Directories->..\..\nsDui\duilib2
C/C++->Preprocessor->Preprocessor Definitions->STATIC_LIB
C/C++->Code Generation->Runtime Library->..\..\nsDui\duilib2

Linker->General->Additional Library Directories->..\..\nsDui\Debug
Linker->General->Additional Library Directories->..\..\nsDui\Release

Linker->Input->Additional Dependencies->duilib.lib

---
### virtual

```
    virtual LPCTSTR GetWindowClassName(void) const = 0 ;

    virtual void InitWindow(){};

    // Skin
    virtual CDuiString GetSkinFolder() = 0;
    virtual CDuiString GetSkinFile() = 0;

    // Zip (ZIPRES)
    virtual UILIB_RESOURCETYPE GetResourceType() const;
    virtual CDuiString GetZIPFileName() const;
    virtual LPCTSTR GetResourceID() const;

    virtual LRESULT HandleMessage(UINT uMsg, WPARAM wParam, LPARAM lParam);

    virtual void Notify(TNotifyUI& msg);

```
