## root 
## iptable 无效
# sysctl -w net.ipv4.ip_forward=1
# ufw disable
# iptables -t nat -A PREROUTING -d 172.26.204.218 -p tcp --dport 80 -j DNAT --to 192.168.2.2:80

## 方向代理

/mnt/d/WSL_Tools/nginx-1.22.0/objs/nginx -c /usr/local/nginx/conf/nginx.conf

## 监听在127.0.0.1:8000 -> 192.168.2.2:80