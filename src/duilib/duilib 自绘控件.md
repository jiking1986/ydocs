duilib 自绘控件
---

### TabLayout

### xml
```
<ChildLayout xmlfile="install_show.xml" />

```

###
```
LRESULT OnCreate(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled)
{
    LONG styleValue = ::GetWindowLong(*this, GWL_STYLE);
    styleValue &= ~WS_CAPTION;
    ::SetWindowLong(*this, GWL_STYLE, styleValue | WS_CLIPSIBLINGS | WS_CLIPCHILDREN);

    m_pm.Init(m_hWnd);
    CDialogBuilder builder;
    CDialogBuilderCallbackEx cb;
    CControlUI* pRoot = builder.Create(_T("skin.xml"), (UINT)0,  &cb, &m_pm);
    ASSERT(pRoot && "Failed to parse XML");
    m_pm.AttachDialog(pRoot);
    m_pm.AddNotifier(this);

    Init();
    return 0;
}

```

###
* https://github.com/wanttobeno/Duilib_Extension.git
