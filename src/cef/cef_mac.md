# cef

---

http://opensource.spotify.com/cefbuilds/cef_binary_76.1.13%2Bgf19c584%2Bchromium-76.0.3809.132_windows32.tar.bz2
http://opensource.spotify.com/cefbuilds/cef_binary_76.1.13%2Bgf19c584%2Bchromium-76.0.3809.132_macosx64.tar.bz2

### Using the Xcode IDE:
cmake -G "Xcode" -DPROJECT_ARCH="x86_64" -DCMAKE_INSTALL_PREFIX="$(pwd)-release"
Open build\cef.xcodeproj in Xcode and select Product > Build.

### Using Ninja:
cmake -G "Ninja" -DPROJECT_ARCH="x86_64" -DCMAKE_INSTALL_PREFIX="$(pwd)-release"
ninja cefclient cefsimple

### .
```
PATH="/Applications/CMake.app/Contents/bin":"$PATH"

cmake .

make -j4

```

include
Chromium Embedded Framework.framework
libcef_dll_wrapper.a
cef_sandbox.a

PATH="~/Qt5.12.4/5.12.4/clang_64/bin":"$PATH"

qmake

make -j4

macdeployqt QCefBrowser.app

cp -R "Chromium Embedded Framework.framework" "QCefBrowser.app/Contents/Frameworks"

otool -L QCefBrowser.app/Contents/MacOS/QCefBrowser

install_name_tool -change "@executable_path/../Frameworks/Chromium Embedded Framework.framework" "@executable_path/../Frameworks/Chromium Embedded Framework.framework" QCefBrowser.app/Contents/MacOS/QCefBrowser

---

```
One may add CMake to the PATH:

 PATH="/Applications/CMake.app/Contents/bin":"$PATH"

Or, to install symlinks to '/usr/local/bin', run:

 sudo "/Applications/CMake.app/Contents/bin/cmake-gui" --install

Or, to install symlinks to another directory, run:

 sudo "/Applications/CMake.app/Contents/bin/cmake-gui" --install=/path/to/bin

```

---

xcode-select: error: tool 'ibtool' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance

sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
