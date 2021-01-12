# ​ffmpeg

---

git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg

run "MSYS2 MinGW 32-bit" (启动慢)

cd ffmpeg

./configure --enable-shared --disable-static --disable-x86asm --prefix=$(pwd)-release
                    # add other options if needed, e.g: optimization, install dir, search path 
                    # particularly CFLAGS and LDFLAGS for x264
                    # to enable H264, add "--enable-gpl --enable-libx264"
make && make install

./configure --help>configure.help

---

export PKG_CONFIG_PATH=/d/github/sip/x264/x264-static-x86/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

./configure --enable-shared --disable-static --disable-asm --prefix=$(pwd)-x86 --enable-gpl --enable-libx264 --extra-cflags="-I/d/github/sip/x264/x264-static-x86/include" --extra-ldflags="-L/d/github/sip/x264/x264-static-x86/lib" --pkgconfigdir="/d/github/sip/x264/x264-static-x86/lib/pkgconfig"
make && make install

---

export PKG_CONFIG_PATH=/d/github/sip/x264/x264-shared-x86/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

./configure --enable-shared --disable-static --disable-asm --prefix=$(pwd)-x86 --enable-gpl --enable-libx264 --extra-cflags="-I/d/github/sip/x264/x264-shared-x86/include" --extra-ldflags="-L/d/github/sip/x264/x264-shared-x86/bin" --pkgconfigdir="/d/github/sip/x264/x264-shared-x86/lib/pkgconfig"

---

// *

export PKG_CONFIG_PATH=/d/github/sip/x264/x264-shared-x86/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

./configure --enable-shared --disable-static --disable-asm --prefix=$(pwd)-x86 --enable-gpl --enable-libx264 --extra-cflags="-I/d/github/sip/x264/x264-shared-x86/include" --extra-ldflags="-LIBPATH:/d/github/sip/x264/x264-shared-x86/bin" --pkgconfigdir="/d/github/sip/x264/x264-shared-x86/lib/pkgconfig" --enable-cross-compile --toolchain=msvc --arch=x86
make && make install

---

config.h -> utf8

---

--extra-cflags=
--extra-ldflags=
"/NODEFAULTLIB:LIBCMTD"

### Q&A

pr: command not found
mktemp: command not found

coreutils
https://ftp.gnu.org/gnu/coreutils/

or

using MSYS2

---

strsafe.h:error: 'WEOF' undeclared (first use in this function)
if(ch==WEOF) {

#include <stdio.h>

#define WEOF    (-1)

---

libavdevice/dshow_filter.c: 错误：隐式声明函数‘wcscpy’ [-Werror=implicit-function-declaration]
wcscpy(this->info.achName, name);

#include <wchar.h>

---

libavdevice/dshow_pin.c:141:11: 错误：隐式声明函数‘wcsdup’ [-Werror=implicit-function-declaration]
*id = wcsdup(L"libAV Pin");

#include <wchar.h>

```
    *id = av_malloc(sizeof(wchar_t) * (wcslen(L"libAV Pin") + 1));
    if (!*id)
        return E_POINTER;

    wcscpy(*id, L"libAV Pin");

```

---

error LNK2026: module unsafe for SAFESEH image.

Linker->Advanced->Image Has Safe Exception Handlers->No

---

error LNK2019: unresolved external symbol _av_***

objdump -a xxx.a
file xxx.so
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /HEADERS avcodec-58.dll

"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avcodec-58.dll   > avcodec-58.def
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avdevice-58.dll  > avdevice-58.def
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avfilter-7.dll   > avfilter-7.def
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avformat-58.dll  > avformat-58.def
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avutil-56.dll    > avutil-56.def
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS postproc-55.dll  > postproc-55.def
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS swresample-3.dll > swresample-3.def
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS swscale-5.dll    > swscale-5.def

EXPORTS

LIB /DEF:avcodec-58.def    /MACHINE:X86 /OUT:avcodec.lib
LIB /DEF:avdevice-58.def   /MACHINE:X86 /OUT:avdevice.lib
LIB /DEF:avfilter-7.def    /MACHINE:X86 /OUT:avfilter.lib
LIB /DEF:avformat-58.def   /MACHINE:X86 /OUT:avformat.lib
LIB /DEF:avutil-56.def     /MACHINE:X86 /OUT:avutil.lib
LIB /DEF:postproc-55.def   /MACHINE:X86 /OUT:postproc.lib
LIB /DEF:swresample-3.def  /MACHINE:X86 /OUT:swresample.lib
LIB /DEF:swscale-5.def     /MACHINE:X86 /OUT:swscale.lib

"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avcodec.lib
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avdevice.lib
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avfilter.lib
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avformat.lib
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS avutil.lib
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS postproc.lib
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS swresample.lib
"D:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\dumpbin.exe" /EXPORTS swscale.lib

---

// *

‪D:\msys32\usr\bin\link.exe
‪D:\msys32\usr\bin\link.exe.backup

D:\msys32\msys2_shell.cmd
D:\msys32\msys2_shell_inherit.cmd

rem set MSYS2_PATH_TYPE=inherit
set MSYS2_PATH_TYPE=inherit

VS2015 x86 Native Tools Command Prompt
D:\msys32\msys2_shell_inherit.cmd -mingw32

which cl link cpp yasm

---

https://github.com/microsoft/FFmpegInterop.git
