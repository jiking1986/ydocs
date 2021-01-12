# openvpn

---

### lzo

wget http://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
tar -zxvf lzo-2.10.tar.gz
cd lzo-2.10
./configure --prefix=$(pwd)-release
make && make install

### openvpn

wget https://swupdate.openvpn.org/community/releases/openvpn-2.4.9.tar.gz

tar -zxf openvpn-<version>.tar.gz
cd openvpn-<version>
./configure --prefix=$(pwd)-release LZO_CFLAGS="-I/root/workspace/openvpn/lzo-2.10-release/include" LZO_LIBS="-L/root/workspace/openvpn/lzo-2.10-release/lib -llzo2"
make
make install
