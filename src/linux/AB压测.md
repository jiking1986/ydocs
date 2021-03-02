AB压测

---

# 安装
yum -y install httpd-tools
# 查看ab版本
ab -v
# 查看帮助
ab --help
测试命令：
ab -n 1000 -c 100 http://127.0.0.1/
