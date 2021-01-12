VS2017 (>=15.7.2), VS2019 (>=16.0.0)
Visual Studio Community Edition
“Desktop development with C++” component and the “MFC/ATL support” sub-components
10.0.19041 or higher Windows 10 SDK
SDK Debugging Tools

https://storage.googleapis.com/chrome-infra/depot_tools.zip
PATH=C:\depot_tools
DEPOT_TOOLS_WIN_TOOLCHAIN=0
set vs2019_install="D:\Program Files (x86)\Microsoft Visual Studio\2019\Community"
cd depot_tools
gclient

git config --global user.name "My Name"
git config --global user.email "my-name@chromium.org"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global branch.autosetuprebase always

85.0.4183
85.0.4183.102
782793

mkdir chromium && cd chromium

fetch chromium

git rebase-update
gclient sync

# Make sure you have all the release tag information in your checkout.
git fetch --tags
# Checkout whatever version you need (known versions can be seen with 'git show-ref --tags')
git checkout -b your_release_branch 74.0.3729.131   # or more explicitly, tags/74.0.3729.131
gclient sync --with_branch_heads --with_tags

gn gen out/Default

gn gen --ide=vs out\Default
devenv out\Default\all.sln

gn gen --ide=vs --filters=//chrome --no-deps out\Default

gn gen out/Default --args="is_component_build = true is_debug = true"

gn gen out/release_x86 --args="is_component_build=true is_debug=false enable_nacl=false target_cpu=x86 blink_symbol_level=0 symbol_level=0 is_official_build=true is_chrome_branded=true"