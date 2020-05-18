# ss5

---

###

* http://ss5.sourceforge.net/
* http://ss5.sourceforge.net/examples.htm

### 下载

* https://sourceforge.net/projects/ss5/files/ss5/3.8.9-8/
* (server)https://nchc.dl.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz

* http://csocks.altervista.org/
* (client)http://csocks.altervista.org/download/csocks_1.7.tar.gz

### 解压

tar -zxvf ss5-3.8.9-8.tar.gz

mkdir csocks_1.7
tar -zxvf csocks_1.7.tar.gz -C csocks_1.7

### 编译

cd ss5-3.8.9
./configure
make
make install

make uninstall
make distclean

### 配置

(修改端口)
/etc/sysconfig/ss5
#SS5_OPTS=" -u root"
SS5_OPTS=" -u root"
SS5_OPTS=" -u root -b 0.0.0.0:10800"

/etc/opt/ss5/ss5.conf
auth    0.0.0.0/0               -               u
permit u        0.0.0.0/0       -       0.0.0.0/0       -       -       -       -       -

/etc/opt/ss5/ss5.passwd
admin 123456

### 启动

chmod +x /etc/rc.d/init.d/ss5

/etc/rc.d/init.d/ss5 start

service ss5 start
service ss5 restart
service ss5 stop
service ss5 status

### 开机启动

chkconfig
chkconfig --add <name>
chkconfig --del <name>

systemctl

### 查看日志

tail -f /var/log/ss5/ss5.log

### curl 测试

curl --socks5 10.2.255.62:1080 -U admin:123456 http://hio.jd.com

curl -x socks5://admin:123456@10.2.255.62:1080 http://hio.jd.com
