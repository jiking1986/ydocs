# Curl

---

## 目标
curl 7.64.0

## 环境
1. Microsoft Windows 10 (1709 - 10.0.16299.1004)
1. Mircosoft Visual Studio Enterprise 2015 (14.0.25431.01 Update 3)

## 准备
1. 源代码 (https://github.com/curl/curl/releases/download/curl-7_64_1/curl-7.64.1.tar.gz)

## 编译
### win32/win64
1. 启动 VS2015 x86/x64 Native Tools Command Prompt
1. cd curl-7.64.0
1. cd winbuild
1. 执行编译指令

```
nmake /f Makefile.vc mode=static VC=14 WITH_SSL=static SSL_PATH="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN32-debug_no-shared_no-asm\OpenSSL" GEN_PDB=yes DEBUG=yes MACHINE=x86

nmake /f Makefile.vc mode=static VC=14 WITH_SSL=static SSL_PATH="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN32-release_no-shared_no-asm\OpenSSL" GEN_PDB=no DEBUG=no MACHINE=x86

nmake /f Makefile.vc mode=static VC=14 WITH_SSL=static SSL_PATH="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN64A-debug_no-shared_no-asm\OpenSSL" GEN_PDB=yes DEBUG=yes MACHINE=x64

nmake /f Makefile.vc mode=static VC=14 WITH_SSL=static SSL_PATH="E:\github\jiking1986\third_party\openssl\openssl-OpenSSL_1_1_1-VC14-WIN64A-release_no-shared_no-asm\OpenSSL" GEN_PDB=no DEBUG=no MACHINE=x64

```

### Linux
```
./configure --with-ssl= --prefix=

make && make install

make clean

```
---
