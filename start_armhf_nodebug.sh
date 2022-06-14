#set network
sudo brctl addbr virbr0
sudo ifconfig virbr0 192.168.2.1/24 up
sudo tunctl -t tap0
sudo ifconfig tap0 192.168.2.11/24 up
sudo brctl addif virbr0 tap0
# 进入qemu主机后 ifconfig eth0 192.168.2.2 up
qemu-system-armhf -M vexpress-a9 \
    -kernel vmlinuz-3.2.0-4-vexpress 
    -initrd initrd.img-3.2.0-4-vexpress \
    -drive if=sd,file=debian_wheezy_armhf_standard.qcow2 \
    -append "root=/dev/mmcblk0p2" \
    -netdev tap,id=tapnet,ifname=tap0,script=no \
    -device rtl8139,netdev=tapnet \
    -nographic
