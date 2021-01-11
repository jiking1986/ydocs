# pjproject

---

https://github.com/pjsip/pjproject/archive/2.10.zip

pjlib/include/pj/config_site.h
```
#define PJMEDIA_HAS_VIDEO	1
#define PJMEDIA_HAS_VID_TOOLBOX_CODEC 1

```

pjmedia/src/pjmedia-codec/ffmpeg_vid_codecs.c
```
#define FF_INPUT_BUFFER_PADDING_SIZE AV_INPUT_BUFFER_PADDING_SIZE

```

./configure --with-sdl=~/Downloads/sip/SDL2/SDL2-2.0.12-release-static --with-ffmpeg=~/Downloads/sip/ffmpeg/ffmpeg-release-static --with-vpx=~/Downloads/sip/libvpx/libvpx-release-static --with-ssl=~/Downloads/sip/openssl/openssl-release-static --prefix=$(pwd)-release

make dep
make && make install

---

--with-sdl=~/Library/Frameworks/SDL2.framework

LDFLAGS="-lx264 -lmp3lame"

export CPPFLAGS="I~/Downloads/sip/ffmpeg/ffmpeg-release-static/include"
export LDFLAGS="L~/Downloads/sip/ffmpeg/ffmpeg-release-static/lib"
export LIBS=""

echo $CPPFLAGS
echo $LDFLAGS
