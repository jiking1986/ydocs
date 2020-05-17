## Building nginx on the Linux platform

### Need
* Linux
* Net
* Development Tools
* Source

### Ready
```
Connect Internet
```



```
su
rm -f /var/run/yum.pid
yum -y groupinstall "Development Tools"
su centos

```

### Get source
```
mkdir workspace
cd workspace
wget https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.gz
wget http://zlib.net/zlib-1.2.11.tar.gz
wget https://www.openssl.org/source/openssl-1.0.2n.tar.gz
wget http://nginx.org/download/nginx-1.14.0.tar.gz

```

```
tar -zxvf nginx-1.14.0.tar.gz
cd nginx-1.14.0
mkdir objs
mkdir objs/lib
cd objs/lib
tar -xzf ../../../pcre-8.41.tar.gz
tar -xzf ../../../zlib-1.2.11.tar.gz
tar -xzf ../../../openssl-1.0.2n.tar.gz
cd ../../

```

```
chmod +x configure
chmod +x ./objs/lib/openssl-1.0.2n/config
chmod +x ./objs/lib/pcre-8.41/configure
chmod +x ./objs/lib/zlib-1.2.11/configure

```

### Build steps

```
./configure \
    --with-debug \
    --prefix= \
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
    --with-stream_ssl_preread_module \
    --with-http_stub_status_module

```

```
mv ./objs/Makefile_linux ./objs/Makefile
mv ./objs/lib/openssl-1.0.2n/ssl/bad_dtls_test_linux.c ./objs/lib/openssl-1.0.2n/ssl/bad_dtls_test.c

```

```
make

```

```
cd objs
cp -r ../conf ./conf
cp -r ../html ./html
mkdir logs
mkdir temp

vi conf/nginx.conf
user  centos;
```

```
su

systemctl stop firewalld.service
systemctl disable firewalld.service

nginx
nginx -s reload
nginx -s stop

```

```
echo "-- package ----------------------------------------------------------------"

release_path="nginx-1.14.1-release"
rm -fr ../$release_path
mkdir -p ../$release_path/bin/nginx
mkdir -p ../$release_path/bin/nginx/logs
mkdir -p ../$release_path/bin/nginx/temp
cp -fr ./conf ../$release_path/bin/nginx/conf
cp -fr ./html ../$release_path/bin/nginx/html
cp -f ./objs/nginx ../$release_path/bin/nginx/nginx
cd ..
zip -r $release_path.zip $release_path

```
