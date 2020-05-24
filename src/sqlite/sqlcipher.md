# sqlcipher

--- ----------------------------------------------------------------

### tcl

https://github.com/tcltk/tcl.git
https://nchc.dl.sourceforge.net/project/tcl/Tcl/8.6.10/tcl8610-src.zip

./configure
make
make install

--- ----------------------------------------------------------------

git config --global core.autocrlf input

cd /E/gitee/jiking1986
git clone https://gitee.com/jiking1986/sqlcipher.git sqlcipher_coding

cd /E/gitee/jiking1986/sqlcipher_coding

git checkout v4.3.0
git checkout -b v4.3.0

#export openssl_dir="/cygdrive/e/github/openssl/VC14-WIN32_release_no-shared_no-asm/Openssl"

export openssl_dir="/E/github/openssl/VC14-WIN32_release_no-shared_no-asm/Openssl"

./configure --enable-debug --enable-shared=false --disable-tcl --with-crypto-lib=none --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2 -DNOCRYPT -DSQLCIPHER_CRYPTO_OPENSSL -lcrypto -static-libgcc -I$openssl_dir/include -L$openssl_dir/lib" LDFLAGS="$openssl_dir/lib/libcrypto.lib" --prefix=$(pwd)-release

make

--- ================================================================

### nmake

### tcl

https://www.activestate.com/products/tcl/downloads/
https://pre-platform-installers.s3.amazonaws.com/ActiveTcl-8.5.18.0.298892-win32-x86_64-threaded.exe?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJAFTYUXEZJ3HWLEQ%2F20200511%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200511T015048Z&X-Amz-Expires=21600&X-Amz-SignedHeaders=host&X-Amz-Signature=240d6b6b12694d025458ac02f8011d3a18aaf58402487c9dcee739b6c990b4e5
https://pre-platform-installers.s3.amazonaws.com/ActiveTcl-8.5.18.0.298892-win32-ix86-threaded.exe?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJAFTYUXEZJ3HWLEQ%2F20200511%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200511T015048Z&X-Amz-Expires=21600&X-Amz-SignedHeaders=host&X-Amz-Signature=3b0ad6cb84301e8ba74e39ff206b314060b1527597d6732b0944eb02eb3e97d4

---

git clone https://gitee.com/jiking1986/sqlcipher.git sqlcipher_coding

cd E:\gitee\jiking1986\sqlcipher_coding

git checkout v4.3.0
git checkout -b v4.3.0

---

TCC = $(TCC) -DSQLITE_TEMP_STORE=2
RCC = $(RCC) -DSQLITE_TEMP_STORE=2

TCC = $(TCC) -DSQLITE_HAS_CODEC
RCC = $(RCC) -DSQLITE_HAS_CODEC

TCC = $(TCC) -I"E:\github\openssl\VC14-WIN32_release_no-shared_no-asm\Openssl\include"
RCC = $(RCC) -I"E:\github\openssl\VC14-WIN32_release_no-shared_no-asm\Openssl\include"

LTLIBPATHS = $(LTLIBPATHS) /LIBPATH:"E:\github\openssl\VC14-WIN32_release_no-shared_no-asm\Openssl\lib"
LTLIBS = $(LTLIBS) libcrypto.lib libssl.lib advapi32.lib crypt32.lib gdi32.lib shell32.lib user32.lib ws2_32.lib

---

nmake /f Makefile.msc

nmake /f Makefile.msc ^
     SQLITE3LIB=sqlcipher.lib ^
     SQLITE3DLL=sqlcipher.dll ^
     SQLITE3EXE=sqlcipher.exe ^
     SQLITE3EXEPDB=/pdb:sqlciphersh.pdb ^
     -DSQLITE_TEMP_STORE=2 ^
     -DSQLITE_HAS_CODEC ^
     -DSQLCIPHER_CRYPTO_OPENSSL ^
     LTLINKOPTS="%openssl_dir%\lib\libeay32.lib" ^
     OPT_FEATURE_FLAGS="-I %openssl_dir%\include -DSQLITE_HAS_CODEC=1 -DSQLCIPHER_CRYPTO_OPENSSL=1"

E:\github\openssl\VC14-WIN32_release_no-shared_no-asm\Openssl\include
E:\github\openssl\VC14-WIN32_release_no-shared_no-asm\Openssl\lib
E:\github\openssl\VC14-WIN32_release_no-shared_no-asm\Openssl\lib\libcrypto.lib
