# Chromium

---

### System requirements
* A 64-bit Mac running 10.14+.
* Xcode 11.2+
* The OS X 10.15.1 SDK. Run
```
ls `xcode-select -p`/Platforms/MacOSX.platform/Developer/SDKs

```
to check whether you have it. Building with a newer SDK works too, but the releases currently use Xcode 11.2.1.

cd /Library
sudo mkdir chromium && cd chromium
sudo chown -R $(whoami) /Library/chromium

### Install depot_tools

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

export PATH="$PATH:/Library/chromium/depot_tools"

### Get the code

git config --global core.precomposeUnicode true

mkdir chromium && cd chromium

fetch --no-history chromium
git fetch origin tag 86.0.4240.111 // git fetch --tags
git checkout -b 86.0.4240.111 86.0.4240.111
gclient sync --with_branch_heads --with_tags

### Setting up the build

gn gen out/Release
gn gen out/Release --ide=xcode
gn args out/Release
```
is_debug = false
is_component_build = false
symbol_level = 0
target_cpu = "x64"

```

### Build Chromium

autoninja -C out/Release chrome

### Run Chromium

out/Release/Chromium.app/Contents/MacOS/Chromium

---

Q: ImportError: No module named httplib2
A: pip install httplib2