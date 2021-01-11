### restart

### user
adduser openresty
passwd openresty

### Net
Wired Connected

git clone https://coding.jd.com/yejiaming1/limit_gateway.git

### modules
git clone https://github.com/cfsego/limit_upload_rate.git

git clone https://github.com/vkholodkov/nginx-upload-module.git
git clone https://github.com/masterzen/nginx-upload-progress-module.git

### openresty
touch openresty-1.17.8.2/bundle/pod/lua-rds-parser-0.06/.gitkeep
touch openresty-1.17.8.2/bundle/pod/ngx_coolkit-0.2/.gitkeep
touch openresty-1.17.8.2/bundle/pod/redis-nginx-module-0.3.7/.gitkeep

### redis
su
yum -y install centos-release-scl
yum -y install devtoolset-9-gcc devtoolset-9-gcc-c++ devtoolset-9-binutils
exit
scl enable devtoolset-9 bash
echo "source /opt/rh/devtoolset-9/enable" >>/etc/profile

tar xzf redis-6.0.9.tar.gz
cd redis-6.0.9
make PREFIX=$(pwd)-release install
cp ./redis.conf $(pwd)-release/bin/redis.conf
cd ..
zip -r redis-6.0.9-release.zip redis-6.0.9-release
