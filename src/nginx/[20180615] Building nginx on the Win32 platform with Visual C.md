## [Building nginx on the Win32 platform with Visual C](http://nginx.org/en/docs/howto_build_on_win32.html)

### Need
* Microsoft Visual C compiler. Microsoft Visual Studio® 8 and 10 are known to work.
* [MSYS](http://www.mingw.org/wiki/MSYS "http://downloads.sourceforge.net/mingw/MSYS-1.0.11.exe").
* Perl, if you want to build OpenSSL® and nginx with SSL support. For example [ActivePerl](https://www.activestate.com/activeperl) or Strawberry Perl.
* [Mercurial](https://www.mercurial-scm.org/) client.
* [PCRE](http://www.pcre.org/ "https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.gz"), [zlib](http://zlib.net/ "http://zlib.net/zlib-1.2.11.tar.gz") and [OpenSSL](http://www.openssl.org/ "https://www.openssl.org/source/openssl-1.0.2n.tar.gz") libraries sources.

### Install tools
* Visual Studio 2015
* MSYS
* Perl
* Mercurial

Add Path
```
\msys\1.0\bin
```

### Build steps
* Start MSYS bash.
```
mkdir building
cd building
hg clone http://hg.nginx.org/nginx
```
```
cd nginx
hg up release-1.14.0
cd ..
```
```
cd nginx
mkdir objs
mkdir objs/lib
cd objs/lib
tar -xzf ../../../pcre-8.41.tar.gz
tar -xzf ../../../zlib-1.2.11.tar.gz
tar -xzf ../../../openssl-1.0.2n.tar.gz
```
```
cd ../../
auto/configure \
    --with-cc=cl \
    --with-debug \
    --prefix= \
    --conf-path=conf/nginx.conf \
    --pid-path=logs/nginx.pid \
    --http-log-path=logs/access.log \
    --error-log-path=logs/error.log \
    --sbin-path=nginx.exe \
    --http-client-body-temp-path=temp/client_body_temp \
    --http-proxy-temp-path=temp/proxy_temp \
    --http-fastcgi-temp-path=temp/fastcgi_temp \
    --http-scgi-temp-path=temp/scgi_temp \
    --http-uwsgi-temp-path=temp/uwsgi_temp \
    --with-cc-opt=-DFD_SETSIZE=1024 \
    --with-pcre=objs/lib/pcre-8.41 \
    --with-zlib=objs/lib/zlib-1.2.11 \
    --with-openssl=objs/lib/openssl-1.0.2n \
    --with-openssl-opt=no-asm \
    --with-select_module \
    --with-http_ssl_module \
    --with-mail \
    --with-mail_ssl_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_ssl_preread_module
```
```
    --add-module=src/ngx_http_hello_module
```
* bad_dtls_test.c -> Unicode

```
mv ./objs/Makefile_win ./objs/Makefile
mv ./objs/lib/openssl-1.0.2n/ssl/bad_dtls_test_win.c ./objs/lib/openssl-1.0.2n/ssl/bad_dtls_test.c

```

* Start "VS2015 x86 本机工具命令提示符".
```
cd building\nginx
nmake
```
```
copy conf
copy html
mkdir logs
mkdir temp
```
