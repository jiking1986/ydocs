# pjsip

---

### pjsua

pjlib\include\pj\config_site.h
```
#include "config_site_sample.h"

#define PJMEDIA_HAS_VIDEO              1
//#define PJMEDIA_HAS_OPENH264_CODEC     1
//#define PJMEDIA_HAS_LIBYUV             1
#define PJMEDIA_VIDEO_DEV_HAS_SDL      1
#define PJMEDIA_VIDEO_DEV_HAS_DSHOW    1
#define PJMEDIA_HAS_FFMPEG             1
#define PJSIP_HAS_TLS_TRANSPORT        1
#define PJ_HAS_SSL_SOCK                1

```

---

pjlib               ../../include
pjmedia             ../../include
pjmedia_codec       ../../include
pjmedia_videodev    ../../include/SDL2

pjlib_test          ../../lib
pjmedia             ../../lib
pjmedia_test        ../../lib
pjnath_test         ../../lib
pjsua               ../../lib
pjsystest           ../../lib
sample_debug        ../../lib

pjmedia_test        Crypt32.lib // CertOpenStor

ffmpeg_vid_codecs.c
#define FF_INPUT_BUFFER_PADDING_SIZE AV_INPUT_BUFFER_PADDING_SIZE
    pj_bzero(avpacket.data+avpacket.size, FF_INPUT_BUFFER_PADDING_SIZE);

---

simple_pjsua.c

---

pjlib\include
pjlib-util\include
pjmedia\include
pjnath\include
pjsip\include

---

../include;../include/pjproject
../lib

#pragma comment(lib, "libcrypto")
#pragma comment(lib, "libssl")

#pragma comment(lib, "SDL2")
#pragma comment(lib, "libx264")

#pragma comment(lib, "avcodec")
#pragma comment(lib, "avdevice")
#pragma comment(lib, "avfilter")
#pragma comment(lib, "avformat")
#pragma comment(lib, "avutil")
#pragma comment(lib, "postproc")
#pragma comment(lib, "swresample")
#pragma comment(lib, "swscale")

#pragma comment(lib, "libpjproject-i386-Win32-vc14-Debug")

#pragma comment(lib, "wsock32")
#pragma comment(lib, "ws2_32")
#pragma comment(lib, "ole32")
#pragma comment(lib, "dsound")

---
