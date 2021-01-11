# openssl

---

git clone https://github.com/openssl/openssl.git

git checkout OpenSSL_1_1_1

./config no-shared --prefix=$(pwd)-release-static --openssldir=$(pwd)-release-static/openssl

make && make install
