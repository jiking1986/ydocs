# shadowsocks-libv-v3.3.0
---

### 新建开发账户
---
adduser admin
passwd admin
su admin
cd
mkdir -p workspace/shadowsocks

### 准备
---
yum update -y
yum groupinstall -y "Development Tools"
yum install -y net-tools
yum install -y epel-release
yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel -y
yum install -y man-pages


### 下载代码
---
cd workspace/shadowsocks
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git checkout v3.3.0
git submodule update --init --recursive
cd ..
zip -r shadowsocks-libev-submodule.zip shadowsocks-libev

### 编译
---
cd shadowsocks-libev
./autogen.sh
./configure --prefix=$(pwd)-release
make
make install
cd ..

### 配置/打包
---
cd shadowsocks-libev-release/bin/
cp /usr/lib64/libmbedcrypto.so.2.7.11 .
ln -s libmbedcrypto.so.2.7.11 libmbedcrypto.so.2
cd ../..
cp ./shadowsocks-libev/debian/config.json ./shadowsocks-libev-release/bin/
```
{
    "server":"0.0.0.0",
    "server_port":8002,
    "local_port":1080,
    "password":"MassMass",
    "timeout":60,
    "method":"aes-256-cfb"
}

```
zip -r shadowsocks-libev-release.zip shadowsocks-libev-release

### 部署/执行
---
unzip shadowsocks-libev-release.zip
cd shadowsocks-libev-release/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./
./ss-server -c ./config.json -u -v >ss.log &

### 优化
---

#### TCP fast open
---
/etc/sysctl.conf
net.ipv4.tcp_fastopen = 3
sysctl -p

echo 3 > /proc/sys/net/ipv4/tcp_fastopen

```
    "fast_open":true,
```

ip tcp_metrics | grep fo_cookie
grep '^TcpExt:' /proc/net/netstat | cut -d ' ' -f 87-92  | column -t
grep '^TcpExt:' /proc/net/netstat | cut -d ' ' -f 91-96  | column -t

#### TCP BBR
---
echo 'net.core.default_qdisc=fq' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control=bbr' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
lsmod | grep bbr

#### ulimit
---
