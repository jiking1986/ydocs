# vsftpd

---

vsftpd -v
yum -y install vsftpd

---

vi /etc/vsftpd/vsftpd.conf
anonymous_enable=YES
anon_upload_enable=YES
anon_mkdir_write_enable=YES

默认目录：var/ftp/
chmod o+w /var/ftp/pub
chmod 777 -R /var/ftp/pub

sestatus -b | grep ftp
setsebool allow_ftpd_full_access 1

systemctl start vsftpd / service vsftpd start
