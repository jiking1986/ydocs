#!/bin/bash

OPENRESTY=openresty-1.15.8.1
PCRE=pcre-8.42
ZLIB=zlib-1.2.11
OPENSSL=openssl-1.1.1b
JOBS=12

tar -zxvf $OPENRESTY.tar.gz
cd $OPENRESTY

rm -rf objs
mkdir -p objs/lib
cd objs/lib
ls ../../..
tar -xf ../../../$OPENSSL.tar.gz
tar -xf ../../../$ZLIB.tar.gz
tar -xf ../../../$PCRE.tar.gz
cd ../..

./configure \
    --with-cc=gcc \
    --with-debug \
    --prefix= \
    --with-cc-opt='-DFD_SETSIZE=1024' \
    --conf-path=conf/nginx.conf \
    --pid-path=logs/nginx.pid \
    --http-log-path=logs/access.log \
    --error-log-path=logs/error.log \
    --sbin-path=nginx \
    --http-client-body-temp-path=temp/client_body_temp \
    --http-proxy-temp-path=temp/proxy_temp \
    --http-fastcgi-temp-path=temp/fastcgi_temp \
    --http-scgi-temp-path=temp/scgi_temp \
    --http-uwsgi-temp-path=temp/uwsgi_temp \
    --with-pcre-jit \
    --without-http_rds_json_module \
    --without-http_rds_csv_module \
    --without-lua_rds_parser \
    --with-ipv6 \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_ssl_preread_module \
    --with-http_v2_module \
    --without-mail_pop3_module \
    --without-mail_imap_module \
    --without-mail_smtp_module \
    --with-http_stub_status_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_auth_request_module \
    --with-http_secure_link_module \
    --with-http_random_index_module \
    --with-http_gzip_static_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-select_module \
    --with-luajit-xcflags="-DLUAJIT_NUMMODE=2 -DLUAJIT_ENABLE_LUA52COMPAT" \
    --with-pcre=objs/lib/$PCRE \
    --with-zlib=objs/lib/$ZLIB \
    --with-openssl=objs/lib/$OPENSSL \
    --with-openssl-opt="no-asm" \
    -j$JOBS

make -j$JOBS
make install

cd bin
rm -f openresty
cd ..

cd nginx
mkdir temp
cd ..

---

pwd

mkdir -p $(pwd)-release/bin/
cp -r bin luajit lualib nginx pod resty.index site $(pwd)-release/bin/

cd ..
zip -r $OPENRESTY-release.zip $OPENRESTY-release

---

scp ./$OPENRESTY-release.zip admin@172.31.16.26:/export/Packages/em.jd.com/

---

packagename=openresty-1.15.8.1-release
unzip $packagename.zip

cd /export/Instances/em.jd.com/server1/runtime/bin
./nginx/nginx -s quit
cd /export/Packages/em.jd.com
ln -fns /export/Packages/em.jd.com/$packagename /export/Packages/em.jd.com/latest
cd /export/Instances/em.jd.com/server1/runtime/bin
./nginx/nginx
cd /export/Packages/em.jd.com
ll
cd /export/Instances/em.jd.com/server1/runtime/bin/nginx/logs
ll

./nginx/nginx
