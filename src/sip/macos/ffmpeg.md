# ​ffmpeg

---

git clone https://git.ffmpeg.org/ffmpeg.git

git checkout n4.3.1
git checkout -b n4.3.1

x264_dir=~/Downloads/sip/x264/x264-release-static
echo $x264_dir

export PKG_CONFIG_PATH=$x264_dir/lib/pkgconfig:$PKG_CONFIG_PATH
echo $PKG_CONFIG_PATH

./configure --disable-shared --enable-static --prefix=$(pwd)-release-static --enable-gpl --enable-libx264 --extra-cflags="-I$x264_dir/include" --extra-ldflags="-L$x264_dir/lib" --pkgconfigdir="$x264_dir/lib/pkgconfig"

make && make install
