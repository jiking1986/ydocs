# docker

---

## 安装、卸载

### 查看当前的内核版本
uname -r

### 移除旧的版本
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

### 安装一些必要的系统工具
yum install -y yum-utils device-mapper-persistent-data lvm2

### 添加软件源信息
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

### 更新 yum 缓存
yum makecache fast

### 安装 Docker-ce
yum -y install docker-ce

脚本安装 Docker
```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

### 启动 Docker 后台服务
systemctl start docker

### 测试运行 hello-world
docker run hello-world
docker ps

### 删除 Docker CE
yum remove docker-ce
rm -rf /var/lib/docker

---

### 进入容器

docker ps -a

docker exec -it "CONTAINER" /bin/bash

docker exec -it 377a7aa65aef  /bin/bash

### 使用

docker pull nginx
docker images nginx

docker run --name nginx-test -p 8001:80 -d nginx

docker start/stop/restart
docker kill
docker rm

docker cp e8d2d221aeca:/usr/share/nginx/html /root/workspace/docker/nginx

docker run --name nginx-test -i -t -d -p 8001:80 \
    -v /app/nginx/html:/usr/share/nginx/html \
    nginx
