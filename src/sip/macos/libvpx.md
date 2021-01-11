# libvpx

---

https://chromium.googlesource.com/webm/libvpx

git checkout v1.9.0
git checkout -b v1.9.0

./configure --disable-shared --enable-static --prefix=$(pwd)-release-static

make && make install
