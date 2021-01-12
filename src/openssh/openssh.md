# openssh

---

### zlib

* https://zlib.net/zlib-1.2.11.tar.gz
```
tar -zxvf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=$(pwd)-release
make
make install

```

### openssl

* https://www.openssl.org/source/openssl-1.1.1h.tar.gz
```
tar -zxvf openssl-1.1.1h.tar.gz
cd openssl-1.1.1h
./config no-shared no-asm --prefix=$(pwd)-release --openssldir=$(pwd)-release/ssl
make
make install

```

### openssh

* https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.4p1.tar.gz
* https://openbsd.hk/pub/OpenBSD/OpenSSH/portable/openssh-8.4p1.tar.gz
```
tar -zxvf openssh-8.4p1.tar.gz
cd openssh-8.4p1

./configure --prefix=$(pwd)-release --sysconfdir=/etc/ssh --with-zlib=/root/src/zlib-1.2.11-release --with-ssl-dir=/root/src/openssl-1.1.1h-release --with-ssl-engine --with-md5-passwords

--with-pam

make
make install

cp -r /etc/ssh /etc/ssh.bak

cp ssh /usr/bin/

cp ./sbin/sshd /etc/init.d/

cp /etc/ssh/sshd_config

cp -a openssh-8.4p1/contrib/redhat/sshd.init /etc/init.d/sshd

```

---

systemctl start sshd

/etc/rc.d/init.d/sshd status
service sshd status
service sshd stop
service sshd start

/etc/rc.d/
/etc/init.d/
/etc/profile.d/
/etc/rc.local
chkconfig --add sshd
chkconfig --list sshd

---

cat /etc/redhat-release

rpm -qa | grep sql
rpm -ql rpmname

rpm -ivh openssh
rpm -e --nodeps openssh

find / -name sshd.pid

rpm -e `rpm -qa |grep openssh`
rpm -e `rpm -qa |grep openssh` --nodeps   //忽略依赖进行移除

# 是否允许ROOT用户远程登录
PermitRootLogin yes
# 是否允许密码登录,在有密钥时候配置
PasswordAuthentication yes
