### 清理账户密码
git config --global credential.helper wincred
git credential-manager uninstall

---

### 存储账户密码（登录前执行）
git config --global credential.helper store
