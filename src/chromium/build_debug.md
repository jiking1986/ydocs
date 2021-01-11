set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set vs2019_install=D:\Program Files (x86)\Microsoft Visual Studio\2019\Community

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
```
ninja -C out\Debug chrome

is_official_build = false