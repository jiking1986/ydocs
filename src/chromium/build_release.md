set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set vs2019_install=D:\Program Files (x86)\Microsoft Visual Studio\2019\Community

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
```
ninja -C out\Release mini_installer

is_official_build = true
is_chrome_branded = true
chrome_pgo_phase = 0