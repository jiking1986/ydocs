Qt5 卡在 launching debugger，无法调试

解决方法是在终端命令设置lldb使用的python版本为2

defaults write com.apple.dt.lldb DefaultPythonVersion 2

defaults read com.apple.dt.lldb
{
    DefaultPythonVersion = 2;
}
