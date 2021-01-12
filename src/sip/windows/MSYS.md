# MSYS2

---

### MSYS

http://www.mingw.org/wiki/MSYS
http://downloads.sourceforge.net/mingw/MSYS-1.0.11.exe

---

### MSYS2

https://www.msys2.org/
https://repo.msys2.org/distrib/
https://repo.msys2.org/distrib/i686/msys2-i686-20200517.exe
https://repo.msys2.org/distrib/x86_64/msys2-x86_64-20200903.exe

pacman -S base-devel
pacman -S gcc
pacman -S git

pacman -S pkg-config

---

pacman -Ss mingw-w64-i686-toolchain
pacman -Ss mingw-w64-x86_64-toolchain

pacman -S mingw-w64-i686-toolchain
pacman -S mingw-w64-x86_64-toolchain

---

‪D:\msys32\usr\bin\link.exe
‪D:\msys32\usr\bin\link.exe.backup

D:\msys32\msys2_shell.cmd
D:\msys32\msys2_shell_inherit.cmd

rem set MSYS2_PATH_TYPE=inherit
set MSYS2_PATH_TYPE=inherit

VS2015 x86 Native Tools Command Prompt
D:\msys32\msys2_shell_inherit.cmd -mingw32

which cl link cpp yasm
