# OpenSSL

---

## 目标
OpenSSL 1.1.1

## 环境
1. Microsoft Windows 10 (1709 - 10.0.16299.1004)
1. Mircosoft Visual Studio Enterprise 2015 (14.0.25431.01 Update 3)
1. Perl (ActivePerl-5.26.3.2603-MSWin32-x64-a95bce075.exe)

## 准备
1. 源代码 (https://github.com/openssl/openssl/archive/OpenSSL_1_1_1.tar.gz)

## 编译
### win32/win64
1. 启动 VS2015 x86/x64 Native Tools Command Prompt
1. cd openssl-OpenSSL_1_1_1
1. 执行编译指令

```
perl Configure debug-VC-WIN32 no-shared no-asm --prefix="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN32-debug_no-shared_no-asm\OpenSSL" --openssldir="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN32-debug_no-shared_no-asm\SSL"

nmake && nmake install

nmake clean

perl Configure VC-WIN32 no-shared no-asm --prefix="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN32-release_no-shared_no-asm\OpenSSL" --openssldir="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN32-release_no-shared_no-asm\SSL"

nmake && nmake install

nmake clean

perl Configure debug-VC-WIN64A no-shared no-asm --prefix="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN64A-debug_no-shared_no-asm\OpenSSL" --openssldir="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN64A-debug_no-shared_no-asm\SSL"

nmake && nmake install

nmake clean

perl Configure VC-WIN64A no-shared no-asm --prefix="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN64A-release_no-shared_no-asm\OpenSSL" --openssldir="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN64A-release_no-shared_no-asm\SSL"

nmake && nmake install

nmake clean

```

### Linux
```
./config no-shared no-asm --prefix= --openssldir=

make && make install

make clean

```
---
