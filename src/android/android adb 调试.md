
---

根目录默认不允许修改
mount -o remount
rw rootfs /

---

./tcpdump -i any -vv -w /sdcard/Download/workspace/test.pcap

adb pull /sdcard/Download/workspace/test.pcap .

adb push ./shadowsocks--universal-4.8.1.apk /sdcard/Download/workspace/
