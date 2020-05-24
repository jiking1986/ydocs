# ntpdate

---

* http://www.ntp.org.cn/pool.php

---

* tzselect
* ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
* ntpdate cn.ntp.org.cn

---

# 修改系统时间

### linux系统时钟有两个，一个是硬件时钟，即BIOS时间，就是我们进行CMOS设置时看到的时间，另一个是系统时钟，是linux系统Kernel时间。当Linux启动时，系统Kernel会去读取硬件时钟的设置，然后系统时钟就会独立于硬件运作。有时我们会发现系统时钟和硬件时钟不一致，因此需要执行时间同步，下面就分享一下时间设置及时钟同步的命令使用方法。

date命令将日期设置为2014年6月18日

 ----   date -s 06/18/14

将时间设置为14点20分50秒

 ----   date -s 14:20:50

将时间设置为2014年6月18日14点16分30秒（MMDDhhmmYYYY.ss）

----date 0618141614.30

### hwclock/clock 命令查看、设置硬件时间

查看系统硬件时钟

hwclock  --show 或者

clock  --show

设置硬件时间

hwclock --set --date="06/18/14 14:55" （月/日/年时:分:秒）或者# clock --set --date="06/18/14 14:55" （月/日/年时:分:秒）

### 同步系统及硬件时钟

使用hwclock或者clock进行同步，

硬件时钟与系统时钟同步：

# hwclock --hctosys 或者 # clock --hctosys  hc代表硬件时间，sys代表系统时间，即用硬件时钟同步系统时钟

系统时钟和硬件时钟同步：

# hwclock --systohc或者# clock --systohc  即用系统时钟同步硬件时钟

---

# 时区设置

### 开始设置时区时，参考网上的资料，使用tzselect 命令来进行，结果发现tzselect命令只是告诉了设置时区的方法，而并不是真的去修改/etc/sysconfig/clock这个文件。换句话说就是tzselect命令仅仅告诉我们通过设置TZ这个环境变量来选择的时区，然后将变量添加到.profile文件中。下面就简单介绍一下如何使用tzselect命令设置时区，以及如何通过修改/etc/sysconfig/clock配置文件来设置时区。

### tzselect

执行tzselect命令-->选择Asia-->选择China-->选择east China - Beijing, Guangdong, Shanghai, etc-->然后输入1。

###

执行完tzselect命令选择时区后，时区并没有更改，只是在命令最后提示你可以执行TZ='Asia/Shanghai'; export TZ 并将这行命令添加到.profile中，然后退出并重新登录。参考下图中date命令看到的结果，最终时区显示为CST，即中国标准时间。

###

修改配置文件来修改时区1、修改/etc/sysconfig/clock         ZONE=Asia/Shanghai

2、rm /etc/localtime3、链接到上海时区文件       

 ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

执行完上述过程后，重启机器，即可看到时区已经更改。
