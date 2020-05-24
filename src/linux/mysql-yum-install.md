检测

rpm -qa | grep mysql

卸载

rpm -e mysql　　// 普通删除模式
rpm -e --nodeps mysql　　// 强力删除模式，如果使用上面命令删除时，提示有依赖的其它文件，则用该命令可以对其进行强力删除

安装

https://repo.mysql.com//mysql80-community-release-el7-3.noarch.rpm
rpm -ivh mysql80-community-release-el7-3.noarch.rpm
yum update
yum install mysql-server

权限设置：

```
Job for mysqld.service failed because the control process exited with error code. See "systemctl status mysqld.service" and "journalctl -xe" for details.
```

chown mysql:mysql -R /var/lib/mysql

初始化 MySQL：

mysqld --initialize

启动 MySQL：

systemctl start mysqld

查看 MySQL 运行状态：

systemctl status mysqld

注意：如果我们是第一次启动 mysql 服务，mysql 服务器首先会进行初始化的配置。

验证

mysqladmin --version

mysqladmin  Ver 8.23 Distrib 5.0.9-0, for redhat-linux-gnu on i386
mysqladmin  Ver 8.0.17 for Linux on x86_64 (MySQL Community Server - GPL)

简单命令

mysql
SHOW DATABASES;

密码

temporary password: /var/log/mysqld.log

mysql -u root -p
!Mysql2019

5.7.5
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('!Mysql2019');
5.7.6
ALTER USER 'root'@'localhost' IDENTIFIED BY '!Mysql2019';

远程登录权限

CREATE USER 'root'@'%' IDENTIFIED BY '!Mysql2019';
ALTER USER 'root'@'%' IDENTIFIED BY '!Mysql2019';

mysqladmin -u root password "root";

登录

mysql -h 45.76.14.83 -P 3306 -u root -p
mysql -h 45.76.14.83 -P 3306 -u root -p!Mysql2019

---

windows

https://dev.mysql.com/downloads/mysql/
