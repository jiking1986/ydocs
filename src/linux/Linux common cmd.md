# Linux 常用指令和服务的搭建

---
### 系统设置

#### 时间
```
date -R ## 查看时间

tzselect ## 选择时区

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime ## 设置时区

/usr/sbin/ntpdate ntp.aliyun.com ## 同步时间

```

#### 用户
```
cat /etc/passwd | grep -v nologin | grep -v halt | grep -v shutdown ## 查看用户列表

userdel -r admin ## 删除用户（慎用）

adduser admin ## 添加用户

passwd admin ## 修改密码 jdadmin

```

#### sudoers
```
vi /etc/sudoers ## readonly

visudo ## 添加 sudo
root    ALL=(ALL)       ALL
admin   ALL=(ALL)       ALL
admin   ALL=(ALL)       NOPASSWD:ALL

cat /etc/sudoers | grep admin ## 查看 admin 设置

```

#### ulimit
```
## su admin
## sudo ulimit -n 65536 (sudo: ulimit: command not found)

vi /etc/security/limits.conf ## 修改 admin limits
#*               soft    core            0
admin            soft    nofile          65535
admin            hard    nofile          65535

ulimit -n ## 查看 ulimit

cat conf/nginx.conf | grep rlimit

```

#### timewait
```
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'

cp /etc/sysctl.conf /etc/sysctl.conf.backup ## 备份

vi /etc/sysctl.conf

net.ipv4.tcp_timestamps=1
net.ipv4.tcp_tw_recycle=1

/sbin/sysctl -p ## 生效

```

---
### 开发环境

#### yum
```
yum update -y ## 更新软件和系统内核（生产环境慎用）

yum upgrade -y ## 更新安装包
yum clean all ## 清除缓存
yum makecache ## 生成缓存

```

#### 开发工具
```
yum groupinstall -y "Development Tools" ### 安装开发工具
yum install -y lrzsz

```

#### 开发目录结构
```
mkdir -p /export/servers/admin/workspace

cd /export
ln -fns /export/servers/admin/workspace workspace

chown -v -R admin:admin /export/servers/admin

chown -R admin:admin /export/workspace

```

#### 编译
```
su admin

cd /export/workspace/
git clone https://coding.jd.com/app/massgateway.git massgateway_git ## 需要git账号和密码

cd massgateway_git
git checkout dev

cp -r massgateway ../massgateway

cd ../massgateway
chmod +x ./build.sh

./build.sh

```

#### 发布（分发安装包脚本）
```
packagename="massgateway-0.0.2.12-release"

scp ./$packagename.zip admin@172.31.16.21:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.16.22:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.16.23:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.16.24:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.16.25:/export/Packages/em.jd.com/

scp ./$packagename.zip admin@172.31.68.124:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.122:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.119:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.123:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.120:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.117:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.121:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.126:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.118:/export/Packages/em.jd.com/
scp ./$packagename.zip admin@172.31.68.125:/export/Packages/em.jd.com/

rz scp.sh

```

---
### 生产环境

#### 生成目录结构

```
mkdir -p /export/servers/admin/App
mkdir -p /export/servers/admin/auto_deploy
mkdir -p /export/servers/admin/Data
mkdir -p /export/servers/admin/home
mkdir -p /export/servers/admin/Instances/em.jd.com/server1
mkdir -p /export/servers/admin/Logs
mkdir -p /export/servers/admin/Packages/em.jd.com
mkdir -p /export/servers/admin/servers/logbook

cd /export
ln -fns /export/servers/admin/Instances Instances
ln -fns /export/servers/admin/Packages Packages

ln -fns /export/Packages/em.jd.com/latest /export/Instances/em.jd.com/server1/runtime

chown -R admin:admin /export/servers/admin
chown -R admin:admin /export/Instances
chown -R admin:admin /export/Packages

```

#### cert

```
rz cert.zip
unzip cert.zip

```

#### whitelist
```
rz whitelist

```

#### 设置定时任务
```
crontab -e

su root
00 * * * * /usr/sbin/ntpdate ntp.jd.com

su admin
00 06 * * * /export/Instances/em.jd.com/server1/runtime/bin/nginx/crontab.sh

crontab -l

```

#### 部署（解压）
```
su admin

clear
ifconfig | grep "inet 172.31.16."

packagename="massgateway-0.0.2.12-release"
cd /export/Packages/em.jd.com
unzip $packagename.zip
cp -r ./cert ./$packagename/bin/nginx/conf/
cp ./whitelist ./$packagename/bin/nginx/
ll
ll ./$packagename/bin/nginx/conf/
cat ./$packagename/bin/nginx/whitelist

```

#### 执行更新/回滚
```
su admin

clear
ifconfig | grep "inet 172.31.16."

packagename="massgateway-0.0.2.12-release"
cd /export/Instances/em.jd.com/server1/runtime/bin/nginx
./nginx -s quit
cd /export/Packages/em.jd.com
ln -fns /export/Packages/em.jd.com/$packagename /export/Packages/em.jd.com/latest
cd /export/Instances/em.jd.com/server1/runtime/bin/nginx
./nginx
cd /export/Packages/em.jd.com
ll
cd /export/Instances/em.jd.com/server1/runtime/bin/nginx/logs
ll

```

#### 查看存活
```
clear
ifconfig | grep "inet 172.31.16."
ps -ef | grep nginx
netstat -ntulp | grep nginx
find /export -name nginx.pid

ll /proc/${pid}/cwd
ll /proc/${pid}/exe

```

### 运维

#### log
```
tail -f access.log

tail -f access.log | grep "HTTP/1.0\" 400"

```

#### log parse
```
yum install -y MySQL-python

git clone https://coding.jd.com/app/massgateway_log_parse.git massgateway_log_parse_git

scp access_172.31.16.21_20191204060001.log admin@172.31.68.124:/export/workspace/massgateway_log_parse/access.log

python main.py

域名:mass.cdb.jddb.com
端口:3358
数据库:mass_mail
读写账号:mass_mail_rw
密码: jTY05OXcehopSmQA
监控页面: http://mass.cdb.jddb.com/#/overview/list

域名:mass.cdb.jddb.com
端口:3358
数据库:mass
读写账号:mass_rw
密码: jTY05OXcehopSmQA
监控页面: http://mass.cdb.jddb.com/#/overview/list

```

#### logbook
```
su admin

cd /export/Instances/em.jd.com/server1/runtime/bin/nginx/logs
touch access.log
touch error.log
touch proxy.log

cd /export/servers/logbook
ln -fns /export/Instances/em.jd.com/server1/runtime/bin/nginx/logs/access.log access.log
ln -fns /export/Instances/em.jd.com/server1/runtime/bin/nginx/logs/error.log error.log
ln -fns /export/Instances/em.jd.com/server1/runtime/bin/nginx/logs/proxy.log proxy.log
ln -fns /export/Instances/em.jd.com/server1/runtime/bin/nginx/logs/warn.log warn.log

ln -fns /export/Instances/em.jd.com/server1/runtime/bin/nginx/logs/history/20190823/access_*.log history.log
ln -fns /export/Packages/em.jd.com/massgateway-0.0.2.5-release/bin/nginx/logs/access.log history.log

```

#### logbook 查找过滤
```
/(05/Aug/2019)(?!.*DeviceType=Outlook.*)

&DeviceType=Android
&DeviceType=iPhone
&DeviceType=iPad
&DeviceType=WindowsMail
```

---
---

---
### 常用指令

#### 系统信息
```
cat /etc/redhat-release ## 系统版本
uname -r ## 内核版本

cat /proc/cpuinfo ## cpu信息
free -h ## 内存信息
df -h ## 硬盘信息

du -sh ## 当前文件夹磁盘信息

```

#### hosts设置
```
vi /etc/hosts

```

#### 防火墙设置
```
firewall-cmd --state
systemctl start firewalld
systemctl stop firewalld

systemctl status firewalld
systemctl enable firewalld ## 开启自启动
systemctl disable firewalld ## 禁用自启动

firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=443/tcp --permanent
firewall-cmd --add-port=8001/tcp --permanent
firewall-cmd --add-port=8002/tcp --permanent
firewall-cmd --add-port=8051/tcp --permanent
firewall-cmd --add-port=8052/tcp --permanent

firewall-cmd --reload
firewall-cmd --list-ports

```

#### mount/umount
```
mount /dev/cdrom /mnt/cdrom
umount /mnt/cdrom

```

#### yum反查安装包
```
yum whatprovides automake autoconf

```
#### 常用工具
```
yum install -y net-tools
yum install -y man-pages

```

#### netstat
```
netstat -ntlp4

```

#### tcpdump
```
tcpdump -i any -v -w dump.pcap

```

#### automake (待整理)
```
# ln -fns /usr/bin/automake automake-1.15

# wget http://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz

```

#### java (待整理)
```

yum remove java-1.7.0-openjdk

yum search java|grep jdk

yum install -y java-1.7.0-openjdk*

---

rpm -qa | grep -E '^open[jre|jdk]|j[re|dk]'

# rpm -e package_name

# https://www.oracle.com/technetwork/java/javase/downloads/index.html

# wget ...
# rpm -ivh jdk-8u221-linux-x64.rpm
# rpm -Uvh jdk-8u221-linux-x64.rpm

---

# curl -O ...
# wget ...
# tar -zxvf jdk-8u221-linux-x64.tar.gz

---

which java ## 查找可执行文件
whereis java
locate # command not found
find

ls -lrt /usr/bin/java
ls -lrt /etc/alternatives/java
cd /usr/lib/jvm

```

#### tomcat
```
wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-7/v7.0.96/bin/apache-tomcat-7.0.96.tar.gz

```

#### 环境变量
```
## vi /etc/profile

export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.33.x86_64 # yum

export JAVA_HOME=/usr/java/jdk1.8.0_221-amd64
export JRE_HOME=/usr/java/jdk1.8.0_221-amd64/jre
export CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

export JAVA_HOME=/export/servers/jdk1.7.0_71
export PATH=$PATH:/export/servers/jdk1.7.0_71

echo $JAVA_HOME
echo $PATH

```

#### nginx
```

PCRE=pcre-8.43
ZLIB=zlib-1.2.11
OPENSSL=openssl-1.1.1c
NGINX=nginx-1.16.1

wget https://ftp.pcre.org/pub/pcre/$PCRE.tar.gz
wget http://zlib.net/$ZLIB.tar.gz
wget https://www.openssl.org/source/$OPENSSL.tar.gz
wget http://nginx.org/download/$NGINX.tar.gz

tar -zxvf $NGINX.tar.gz
cd $NGINX
mkdir objs
mkdir objs/lib
cd objs/lib
tar -xzf ../../../$PCRE.tar.gz
tar -xzf ../../../$ZLIB.tar.gz
tar -xzf ../../../$OPENSSL.tar.gz
cd ../../

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
    --with-pcre=objs/lib/$PCRE \
    --with-zlib=objs/lib/$ZLIB \
    --with-openssl=objs/lib/$OPENSSL \
    --with-openssl-opt=no-asm \
    --with-select_module \
    --with-http_ssl_module \
    --with-mail \
    --with-mail_ssl_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_ssl_preread_module \
    --with-http_stub_status_module

make

release_path="$NGINX-release"
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

#### php
```

PHP=php-7.4.0

wget https://www.php.net/distributions/$PHP.tar.gz

tar zxf $PHP.tar.gz

cd $PHP
./configure --prefix=$(pwd)-release --enable-fpm --with-mysqli
make
make install

## 配置
cp php.ini-development /usr/local/php/php.ini
cp /usr/local/etc/php-fpm.d/www.conf.default /usr/local/etc/php-fpm.d/www.conf
cp sapi/fpm/php-fpm /usr/local/bin

```

#### MySQL
```
rpm -qa | grep mysql

rpm -e mysql ## 普通删除模式
rpm -e --nodeps mysql ## 强力删除模式，如果使用上面命令删除时，提示有依赖的其它文件，则用该命令可以对其进行强力删除

## 下载安装
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update
yum install mysql-server

chown mysql:mysql -R /var/lib/mysql ## 权限设置

mysqld --initialize ## 初始化 MySQL

systemctl start mysqld ## 启动 MySQL

systemctl status mysqld ## 查看 MySQL 运行状态

mysqladmin --version ## 验证 MySQL 安装

## 登录
mysql -h mass.cdb.jddb.com -P 3358 -u root -p
mysql -h mass.cdb.jddb.com -P 3358 -u root -pjTY05OXcehopSmQA

# wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-client-8.0.17-1.el7.x86_64.rpm
# wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-server-8.0.17-1.el7.x86_64.rpm

```

#### redis
```
wget http://download.redis.io/releases/redis-5.0.7.tar.gz
tar xzf redis-5.0.7.tar.gz
cd redis-5.0.7
make
make PREFIX=$(pwd)-release install

## 启动

./redis-server
./redis-server &
./redis-server ../redis.conf

./redis-cli

## 后台启动 (vi redis.conf)
daemonize no -> daemonize yes

./redis-cli shutdown ### 关闭服务

## 设置密码

# requirepass foobared

config set requirepass 123456
config get requirepass

## 远程登录
redis-cli -h 172.31.68.124 -p 6379 -a 123456
redis-cli -h 172.31.68.124 -p 6379
auth 123456

```

#### openresty
```
mkdir -p /export/workspace/openresty
cd /export/workspace/openresty

# scp openresty-1.15.8.1.tar.gz admin@172.31.68.124:/export/workspace/openresty/
# scp pcre-8.42.tar.gz admin@172.31.68.124:/export/workspace/openresty/
# scp zlib-1.2.11.tar.gz admin@172.31.68.124:/export/workspace/openresty/
# scp openssl-1.1.1b.tar.gz admin@172.31.68.124:/export/workspace/openresty/

wget https://openresty.org/download/openresty-1.15.8.1.tar.gz
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz
wget http://zlib.net/zlib-1.2.11.tar.gz
wget https://www.openssl.org/source/openssl-1.1.1b.tar.gz

PCRE=pcre-8.42
ZLIB=zlib-1.2.11
OPENSSL=openssl-1.1.1b
JOBS=12

tar -zxvf openresty-1.15.8.1.tar.gz
cd openresty-1.15.8.1
mkdir -p objs/lib
cd objs/lib
tar -xf ../../../$OPENSSL.tar.gz
tar -xf ../../../$ZLIB.tar.gz
tar -xf ../../../$PCRE.tar.gz
cd ../..

./configure \
    --with-cc=gcc \
    --with-debug \
    --prefix= \
    --with-cc-opt='-DFD_SETSIZE=1024' \
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
    --with-pcre-jit \
    --without-http_rds_json_module \
    --without-http_rds_csv_module \
    --without-lua_rds_parser \
    --with-ipv6 \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_ssl_preread_module \
    --with-http_v2_module \
    --without-mail_pop3_module \
    --without-mail_imap_module \
    --without-mail_smtp_module \
    --with-http_stub_status_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_auth_request_module \
    --with-http_secure_link_module \
    --with-http_random_index_module \
    --with-http_gzip_static_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-select_module \
    --with-luajit-xcflags="-DLUAJIT_NUMMODE=2 -DLUAJIT_ENABLE_LUA52COMPAT" \
    --with-pcre=objs/lib/$PCRE \
    --with-zlib=objs/lib/$ZLIB \
    --with-openssl=objs/lib/$OPENSSL \
    --with-openssl-opt="no-asm" \
    -j$JOBS
make -j$JOBS
make install

cd nginx
mkdir temp
cd ..
mkdir $(pwd)-release
cp -r bin luajit lualib nginx pod resty.index site $(pwd)-release
cd ..

zip -r openresty-1.15.8.1-release.zip openresty-1.15.8.1-release

```

#### shadowsocks
```
yum install epel-release -y
yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel -y

mkdir -p /export/workspace/shadowsocks
cd /export/workspace/shadowsocks

git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive

cd ..
zip -r shadowsocks-libev-submodule.zip shadowsocks-libev
cd shadowsocks-libev

./autogen.sh
./configure --prefix=$(pwd)-release
make
make install

cd ..

cp ./shadowsocks-libev/debian/config.json shadowsocks-libev-release/bin
zip -r shadowsocks-libev-release.zip shadowsocks-libev-release

cd shadowsocks-libev-release/bin
./ss-server -c ./config.json -u -v >ss.log &

```

#### 问题
```
Q:
aclocal-1.15: command not found
WARNING: 'aclocal-1.15' is missing on your system.

A:
touch ./objs/Makefile
touch ./objs/lib/pcre-8.41/Makefile
touch ./objs/lib/openssl-1.0.2n/Makefile

```

```
vi src/mass/mass.c ## 201

```

```
Q:
ImportError: No module named MySQLdb

A:
yum install -y MySQL-python

```
