#!/bin/sh
# Copyright (C) 2015 Xiaomi
curl -o /tmp/mnt/frps.ini https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps.ini

if [ -f "/tmp/mnt/frps0" ]; then
    echo "文件已存在，停止执行脚本。"
    exit 1 
fi

iptables -t nat -A PREROUTING -p tcp --dport 8000 -j DNAT --to-destination 192.168.0.2:8000
iptables -t nat -A POSTROUTING -j MASQUERAD
iptables -t nat -A PREROUTING -p tcp --dport 853 -j DNAT --to-destination 192.168.0.1:1233
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport 37671 -j DNAT --to-destination 192.168.0.1:37670
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport 3001 -j DNAT --to-destination 192.168.0.1:3000
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport 2223 -j DNAT --to-destination 192.168.0.1:2222
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport 4444 -j DNAT --to-destination 192.168.0.1:3333
iptables -t nat -A POSTROUTING -j MASQUERAD


curl -o /tmp/mnt/frps https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps
curl -o /tmp/mnt/frps0 https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps0
chmod +x /tmp/mnt/frps
( /tmp/mnt/frps -c /tmp/mnt/frps.ini ) &

