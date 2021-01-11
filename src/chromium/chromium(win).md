VS2019
Windows 10 SDK (10.0.19041.0)

---

x86 Native Tools Command Prompt for VS 2019

set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set vs2019_install=D:\Program Files (x86)\Microsoft Visual Studio\2019\Community

depot_tools
gclient

git config --global user.name "My Name"
git config --global user.email "my-name@chromium.org"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global branch.autosetuprebase always

mkdir chromium && cd chromium

fetch --no-history chromium
git fetch origin tag 86.0.4240.111 // git fetch --tags
git checkout -b 86.0.4240.111 86.0.4240.111
gclient sync --with_branch_heads --with_tags

---

gn gen --ide=vs --filters=//chrome --no-deps out\Debug
gn args out\Debug
```
is_debug = true
is_component_build = true
enable_nacl = false
target_cpu = "x86"
blink_symbol_level = 2
symbol_level = 2
ffmpeg_branding = "Chrome"
proprietary_codecs = true
is_official_build = false
```
ninja -C out\Debug chrome

---

gn gen --ide=vs out\Release
gn gen --ide=vs --filters=//chrome --no-deps out\Release
gn args out\Release
```
is_debug = false
is_component_build = false
enable_nacl = false
target_cpu = "x86"
blink_symbol_level = 0
symbol_level = 0
ffmpeg_branding = "Chrome"
proprietary_codecs = true
is_official_build = true
is_chrome_branded = true
chrome_pgo_phase = 0
```
autoninja -C out\Release chrome
ninja -C out\Release mini_installer

---

gn help gen
gn help --markdown all
gn args out/Release --list --short
gn args out/Release --list --short --overrides-only

---

src\chrome\app\chrome_exe_main_win.cc // main

src\chrome\app\theme\chromium\win\chromium.ico // icon

src\ui\views\window\non_client_view.h // views::Widget 

---

chromium
*.grd;*.grdp;-/out
