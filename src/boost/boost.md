# Boost

---

## 目标
boost 1.68.0

## 环境
1. Microsoft Windows 10 (1709 - 10.0.16299.1004)
1. Mircosoft Visual Studio Enterprise 2015 (14.0.25431.01 Update 3)

## 准备
1. 源代码 (https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.zip)

## 编译
### win32/win64
1. 启动 VS2015 x86/x64 Native Tools Command Prompt
1. cd boost_1_68_0
1. 执行编译指令

```
bootstrap

.\b2 --help

.\b2 install --prefix="E:\github\jiking1986\third_party\boost\boost_1_68_0-vc14-build" --build-dir="E:\github\jiking1986\third_party\boost\boost_1_68_0-vc14-build-dir" --build-type=complete toolset=msvc-14.0 debug release link=static threading=multi runtime-link=static

.\b2 install --prefix="E:\github\jiking1986\third_party\boost\boost_1_68_0-msvc14-x86" --build-type=complete --build-dir="E:\github\jiking1986\third_party\boost\boost_1_68_0-msvc14-x86-build-dir" toolset=msvc-14.0

.\b2 install --prefix="E:\github\jiking1986\third_party\boost\boost_1_68_0-msvc14-x64" --build-type=complete --build-dir="E:\github\jiking1986\third_party\boost\boost_1_68_0-msvc14-x64-build-dir" toolset=msvc-14.0 address-model=64

// variant=debug|release
// 只编译64位： architecture=x86 address-model=64

```
