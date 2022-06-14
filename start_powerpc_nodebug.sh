#set network
sudo brctl addbr virbr0
sudo ifconfig virbr0 192.168.2.1/24 up
sudo tunctl -t tap0
sudo ifconfig tap0 192.168.2.11/24 up
sudo brctl addif virbr0 tap0
# 进入qemu主机后 ifconfig eth0 192.168.2.2 up
qemu-system-ppc -M PPC \
    -hda debian_squeeze_powerpc_standard.qcow2 \
    -append "root=/dev/sda1" \
    -netdev tap,id=tapnet,ifname=tap0,script=no \
    -device rtl8139,netdev=tapnet \
    -nographic \

