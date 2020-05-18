# shadowsocks-libev

---

git config --global core.autocrlf input

# git clone https://github.com/shadowsocks/shadowsocks-libev.git
# cd shadowsocks-libev
# git submodule update --init --recursive
git clone --recursive https://github.com/shadowsocks/shadowsocks-libev.git

# yum install epel-release -y
# yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel -y

yum remove epel-release -y
yum remove gcc -y
yum remove gettext -y
yum remove autoconf -y
yum remove libtool -y
yum remove automake -y
yum remove make -y
yum remove pcre-devel -y
yum remove asciidoc -y
yum remove xmlto -y
yum remove c-ares-devel -y
yum remove libev-devel -y
yum remove libsodium-devel -y
yum remove mbedtls-devel -y

yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm epel-release -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm gcc -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm gettext -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm autoconf -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm libtool -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm automake -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm make -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm pcre-devel -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm asciidoc -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm xmlto -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm c-ares-devel -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm libev-devel -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm libsodium-devel -y
yum reinstall --downloadonly --downloaddir=/root/workspace/rpm/shadowsocks-libev-rpm mbedtls-devel -y

rpm -ivh *.rpm --nodeps --force

# Installation of libsodium
# https://download.libsodium.org/libsodium/releases/libsodium-1.0.16.tar.gz
export LIBSODIUM_VER=1.0.16
wget https://download.libsodium.org/libsodium/releases/libsodium-$LIBSODIUM_VER.tar.gz
tar xvf libsodium-$LIBSODIUM_VER.tar.gz
pushd libsodium-$LIBSODIUM_VER
./configure --prefix=/usr && make
sudo make install
popd
sudo ldconfig

# Installation of MbedTLS
# https://tls.mbed.org/download/mbedtls-2.6.0-gpl.tgz
export MBEDTLS_VER=2.6.0
wget https://tls.mbed.org/download/mbedtls-$MBEDTLS_VER-gpl.tgz
tar xvf mbedtls-$MBEDTLS_VER-gpl.tgz
pushd mbedtls-$MBEDTLS_VER
make SHARED=1 CFLAGS="-O2 -fPIC"
sudo make DESTDIR=/usr install
popd
sudo ldconfig

./autogen.sh

./configure --prefix=/root/workspace/shadowsocks/shadowsocks-libev-release

make

make install

/root/workspace/shadowsocks/shadowsocks-libev/debian/config.json

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./

./ss-server -c ./config.json

```
{
    "server":"0.0.0.0",
    "server_port":8388,
    "local_port":1080,
    "password":"12345678",
    "timeout":60,
    "method":"chacha20-ietf-poly1305",
    "dns_server":["8.8.8.8", "8.8.4.4"]
}

```

yumdownloader --resolve epel-release
yumdownloader --resolve gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-deve

cat /etc/resolv.conf
cat /etc/hosts
