# yum

---

rm -f /var/run/yum.pid

---

yum update
yum groupinstall -y "Development Tools"

---

1. 列出所有可更新的软件清单命令：yum check-update
2. 更新所有软件命令：yum update
3. 仅安装指定的软件命令：yum install <package_name>
4. 仅更新指定的软件命令：yum update <package_name>
5. 列出所有可安裝的软件清单命令：yum list
6. 删除软件包命令：yum remove <package_name>
7. 查找软件包 命令：yum search <keyword>
8. 清除缓存命令:
 * yum clean packages: 清除缓存目录下的软件包
 * yum clean headers: 清除缓存目录下的 headers
 * yum clean oldheaders: 清除缓存目录下旧的 headers
 * yum clean, yum clean all (= yum clean packages; yum clean oldheaders) :清除缓存目录下的软件包及旧的headers

---

### 备份yum原镜像

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

### 下载

wget -O /etc/yum.repos.d/CentOS-Base.repo http://xxx/Centos-7.repo

---

### 阿里云 yum 源
* http://mirrors.aliyun.com/repo/Centos-5.repo
* http://mirrors.aliyun.com/repo/Centos-6.repo
* http://mirrors.aliyun.com/repo/Centos-7.repo

### 网易 yum 源
* http://mirrors.163.com/.help/CentOS5-Base-163.repo
* http://mirrors.163.com/.help/CentOS6-Base-163.repo
* http://mirrors.163.com/.help/CentOS7-Base-163.repo

### 搜狐 yum 源
* http://mirrors.sohu.com/help/centos.html

### 中科大 yum 源
* https://lug.ustc.edu.cn/wiki/mirrors/help/centos

---

###  清除缓存
###  生成缓存
yum clean all
yum makecache

---
