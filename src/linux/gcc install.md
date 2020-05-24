# gcc install

---

* https://gcc.gnu.org/install/prerequisites.html

---

yum install -y --downloadonly --downloaddir=/root/workspace/rpm 

yum reinstall -y --downloadonly --downloaddir=/root/workspace/rpm 

---

mount /dev/cdrom /mnt/cdrom/
umount /mnt/cdrom/

---

cd /mnt/cdrom/Packages

---

rpm -ivh gmp-6.0.0-11.el7.x86_64.rpm
rpm -ivh gmp-devel-6.0.0-11.el7.x86_64.rpm

rpm -ivh mpfr-3.1.1-4.el7.x86_64.rpm
rpm -ivh mpfr-devel-3.1.1-4.el7.x86_64.rpm

rpm -ivh libmpc-1.0.1-3.el7.x86_64.rpm
rpm -ivh libmpcdec-1.2.6-12.el7.x86_64.rpm

---

rpm -ivh glibc-2.17-78.el7.x86_64.rpm
rpm -ivh glibc-devel-2.17-78.el7.x86_64.rpm
rpm -ivh glibc-utils-2.17-78.el7.x86_64.rpm
rpm -ivh glibc-common-2.17-78.el7.x86_64.rpm
rpm -ivh glibc-headers-2.17-78.el7.x86_64.rpm

rpm -ivh libstdc++-4.8.3-9.el7.x86_64.rpm
rpm -ivh libstdc++-devel-4.8.3-9.el7.x86_64.rpm
rpm -ivh libstdc++-docs-4.8.3-9.el7.x86_64.rpm

rpm -ivh gcc-4.8.3-9.el7.x86_64.rpm --nodeps
rpm -ivh gcc-gfortran-4.8.3-9.el7.x86_64.rpm --nodeps
rpm -ivh gcc-objc-4.8.3-9.el7.x86_64.rpm --nodeps
rpm -ivh gcc-c++-4.8.3-9.el7.x86_64.rpm --nodeps
rpm -ivh gcc-gnat-4.8.3-9.el7.x86_64.rpm --nodeps
rpm -ivh gcc-objc++-4.8.3-9.el7.x86_64.rpm --nodeps

---

rpm -ivh make-3.82-21.el7.x86_64.rpm

rpm -ivh libarchive-3.1.2-7.el7.x86_64.rpm
rpm -ivh cmake-2.8.11-4.el7.x86_64.rpm

---

### install cmake by src

./bootstrap && make && make install
