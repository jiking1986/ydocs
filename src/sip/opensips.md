# opensips

---

git clone https://github.com/OpenSIPS/opensips.git -b 3.1 opensips-3.1
wget https://github.com/OpenSIPS/opensips/archive/3.1.0.zip

apt-get install libncurses5-dev

make all

make menuconfig

FASTER=1 make -j4 install

---

1） 永久性生效，重启后不会复原

开启： chkconfig iptables on

关闭： chkconfig iptables off

2） 即时生效，重启后复原

开启： service iptables start

关闭： service iptables stop

yum install mysql
yum install mysql-server
yum install mysql-devel
yum install gcc gcc-c++
yum install ncurses-devel
yum install flex
yum install bison

---

wget https://github.com/sippy/rtpproxy/archive/v2.1.0.tar.gz

./configure --prefix=$(pwd)-release
make && make install

./rtpproxy -l 10.2.255.61 -s udp:10.2.255.61:12221 -F

./rtpproxy -F -l 10.2.255.61 -s udp:10.2.255.61:12221

./rtpproxy -F -l 172.31.68.117 -s udp:172.31.68.117:12221

./rtpproxy -F -l 10.2.255.61 -s udp:10.2.255.61:12221 -d DBUG:LOG_LOCAL5

---

make menuconfig

make all prefix=$(pwd)-release
make install prefix=$(pwd)-release

./opensipsdbctl create

./opensipsctl start

./opensipsctl add 1001 1001
./opensipsctl add 1002 1002
./opensipsctl add 1003 1003
./opensipsctl add 1004 1004
./opensipsctl add 1005 1004
./opensipsctl add 1006 1006
./opensipsctl add 1007 1007
./opensipsctl add 1008 1008
./opensipsctl add 1009 1009

./opensipsctl rm 1001

./opensipsctl ul show
./opensipsctl online

touch /var/log/opensips.log

vi /etc/rsyslog.conf
local0.*        /var/log/opensips.log

/etc/init.d/rsyslog restart

config 勾选tcp&nat

---

### mysql error

mysql

ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (2)

service mysqld start

---

### mysql password

mysql
set password for 'root'@'localhost'=password('root');
exit
mysql -u root -p
root

// 设置密码
set password for 'root'@'localhost' =password('123456');
// 设置远程访问及全表权限
grant all privileges on *.* to root@'%'identified by '123456';
// 更新权限
flush privileges;
