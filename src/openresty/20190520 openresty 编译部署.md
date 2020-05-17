# openresty

---

### 下载
```
https://openresty.org/download/openresty-1.15.8.1.tar.gz
ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz
http://zlib.net/zlib-1.2.11.tar.gz
https://www.openssl.org/source/openssl-1.1.1b.tar.gz

```

### 安装前的准备
必须将这些库 perl 5.6.1+, libpcre, libssl安装在您的电脑之中。
对于Linux来说, 您需要确认使用 ldconfig 命令，让其在您的系统环境路径中能找到它们。

### 安装
```
tar -xzvf openresty-1.15.8.1.tar.gz
cd openresty-1.15.8.1/

mkdir objs
mkdir objs/lib
cd objs/lib
tar -xzf ../../../pcre-8.42.tar.gz
tar -xzf ../../../zlib-1.2.11.tar.gz
tar -xzf ../../../openssl-1.1.1b.tar.gz
cd ../../

./configure \
    --prefix=$(pwd)-release \
    --with-debug \
    --with-pcre=objs/lib/pcre-8.42 \
    --with-zlib=objs/lib/zlib-1.2.11 \
    --with-openssl=objs/lib/openssl-1.1.1b \
    --with-openssl-opt=no-asm \
    -j12

make -j12
make install

```

---

```
export PATH=$PATH:./
echo $PATH

export LIBRARY_PATH=$LIBRARY_PATH:./
echo $LIBRARY_PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./
echo $LD_LIBRARY_PATH

```

### 配置
```
    ################################################################

    server {

        listen 8001;

        location / {

            client_max_body_size  100m;    ## 1m;
            proxy_connect_timeout  60s;    ## 60s;
            proxy_read_timeout  60s;       ## 60s;
            proxy_send_timeout  60s;       ## 60s;
            proxy_buffer_size  32k;        ## 4k|8k;
            proxy_buffers  32  32k;        ## 8  4k|8k;
            proxy_busy_buffers_size  32k;  ## 8k|16k;

            set_by_lua $jd_ip 'return ngx.req.get_headers()["jd_ip"]';
            set_by_lua $jd_host 'return ngx.req.get_headers()["jd_host"]';

            proxy_pass $jd_ip;
            proxy_set_header Host $jd_host;
        }

        location /hello {
            default_type text/html;
            content_by_lua_block {
                ngx.say("hello, openresty")
            }
        }
    }

```

---

### ldd

---
### ln
