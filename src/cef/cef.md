# CEF开发

---

### Windows 环境

* Visual Studio
* Qt
* cmake

### Mac 环境

* Xcode
* Qt
* cmake

---

### 代码


### 编译

* cef_binary_xxx_windows32 (cmake) -> cef_binary_xxx_windows32_vs2015\cef.sln
* cef.sln (libcef_dll_wrapper) -> cef_binary_xxx_windows32_vs2015\libcef_dll_wrapper\Debug|Release\libcef_dll_wrapper.lib

---

### CEF 调用

### 样例

* cefsimple

头文件：
* cef_binary_xxx_windows32\include

编译依赖：
* libcef.lib
* libcef_dll_wrapper.lib

Manifest
cefsimple.exe.manifest

Build Events->Post-Build Event->Command Line
```
setlocal
mt.exe -nologo -manifest "cef.exe.manifest" "compatibility.manifest" -outputresource:"../Debug/cefsimpletest.exe";#1
if %errorlevel% neq 0 goto :cmEnd
:cmEnd
endlocal & call :cmErrorLevel %errorlevel% & goto :cmDone
:cmErrorLevel
exit /b %1
:cmDone
if %errorlevel% neq 0 goto :VCEnd
```
```
setlocal
mt.exe -nologo -manifest "cef.exe.manifest" "compatibility.manifest" -outputresource:"../Release/cefsimpletest.exe";#1
if %errorlevel% neq 0 goto :cmEnd
:cmEnd
endlocal & call :cmErrorLevel %errorlevel% & goto :cmDone
:cmErrorLevel
exit /b %1
:cmDone
if %errorlevel% neq 0 goto :VCEnd
```

运行依赖：
* cef_binary_xxx_windows32\Debug|Release
* cef_binary_xxx_windows32\Resources

修改 Runtime Library

### 调试

* --renderer-process-limit=1
* --renderer-startup-dialog
* --url=file:///js.html

> Visual Studio 设置环境变量
Environment:
* PATH=%PATH%;..\bin\Debug
* PATH=%PATH%;..\bin\Release

---

### cefclient

> Debugging -> Environment

> C/C++ -> General -> Additional Include Directories
> C/C++ -> Preprocessor-> Preprocessor Definitions
> C/C++ -> Code Generation -> Runtime Library

> Additional Library Directories
> Additional Dependencies

> Manifest Tool -> Input and Output -> Additional Manifest Files

> Build Events -> Post-Build Event -> Command Line

```
PATH=%PATH%;..\bin\Debug
PATH=%PATH%;..\bin\Release
```

```
.\
```

CEF_USE_SANDBOX

```
WIN32;_DEBUG;_WINDOWS;%(PreprocessorDefinitions)
->
_CRT_SECURE_NO_WARNINGS;WIN32;_WINDOWS;__STDC_CONSTANT_MACROS;__STDC_FORMAT_MACROS;_WIN32;UNICODE;_UNICODE;WINVER=0x0601;_WIN32_WINNT=0x601;NOMINMAX;WIN32_LEAN_AND_MEAN;_HAS_EXCEPTIONS=0;PSAPI_VERSION=1;CEF_USE_SANDBOX;CEF_USE_ATL;CMAKE_INTDIR="Debug";%(PreprocessorDefinitions)
```
```
WIN32;NDEBUG;_WINDOWS;%(PreprocessorDefinitions)
->
WIN32;_WINDOWS;NDEBUG;__STDC_CONSTANT_MACROS;__STDC_FORMAT_MACROS;_WIN32;UNICODE;_UNICODE;WINVER=0x0601;_WIN32_WINNT=0x601;NOMINMAX;WIN32_LEAN_AND_MEAN;_HAS_EXCEPTIONS=0;PSAPI_VERSION=1;CEF_USE_SANDBOX;CEF_USE_ATL;_NDEBUG;CMAKE_INTDIR="Release";%(PreprocessorDefinitions)
```

```
.\lib\Debug
.\lib\Release
```

```
libcef.lib
libcef_dll_wrapper.lib
comctl32.lib
rpcrt4.lib
shlwapi.lib
ws2_32.lib
d3d11.lib
glu32.lib
imm32.lib
opengl32.lib
oleacc.lib
cef_sandbox.lib
dbghelp.lib
PowrProf.lib
Propsys.lib
psapi.lib
SetupAPI.lib
version.lib
wbemuuid.lib
winmm.lib
```

```
./cefclient/resources/win/cefclient.exe.manifest
```

```
setlocal
mt.exe -nologo -manifest "./cefclient/resources/win/cefclient.exe.manifest" "./cefclient/resources/win/compatibility.manifest" -outputresource:"../Debug/cefclienttest.exe";#1
if %errorlevel% neq 0 goto :cmEnd
:cmEnd
endlocal & call :cmErrorLevel %errorlevel% & goto :cmDone
:cmErrorLevel
exit /b %1
:cmDone
if %errorlevel% neq 0 goto :VCEnd
```
```
setlocal
mt.exe -nologo -manifest "./cefclient/resources/win/cefclient.exe.manifest" "./cefclient/resources/win/compatibility.manifest" -outputresource:"../Release/cefclienttest.exe";#1
if %errorlevel% neq 0 goto :cmEnd
:cmEnd
endlocal & call :cmErrorLevel %errorlevel% & goto :cmDone
:cmErrorLevel
exit /b %1
:cmDone
if %errorlevel% neq 0 goto :VCEnd
```

### ---

$(OutDir)$(TargetName)$(TargetExt)
$(OutDir)\$(ProjectName).exe

```
setlocal
mt.exe -nologo -manifest "./tests/cefsimple/cefsimple.exe.manifest" "./tests/cefsimple/compatibility.manifest" -outputresource:"./tests/cefsimple/Debug/cefsimple.exe";#1
if %errorlevel% neq 0 goto :cmEnd
:cmEnd
endlocal & call :cmErrorLevel %errorlevel% & goto :cmDone
:cmErrorLevel
exit /b %1
:cmDone
if %errorlevel% neq 0 goto :VCEnd

```

```
setlocal
mt.exe -nologo -manifest "./tests/cefclient/resources/win/cefclient.exe.manifest" "./tests/cefclient/resources/win/compatibility.manifest" -outputresource:"./tests/cefclient/Debug/cefclient.exe";#1
if %errorlevel% neq 0 goto :cmEnd
:cmEnd
endlocal & call :cmErrorLevel %errorlevel% & goto :cmDone
:cmErrorLevel
exit /b %1
:cmDone
if %errorlevel% neq 0 goto :VCEnd

```
