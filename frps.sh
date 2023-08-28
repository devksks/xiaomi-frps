#!/bin/sh
# Copyright (C) 2015 Xiaomi
curl -o /tmp/mnt/frps.ini https://www.dasabi.tk/d/root/share/Alist/ip/frp/frps.ini?sign=fZAlihk8fqXCCbY5xkBZiOyd0cpCW_lHDZDm-h5VD-0=:0

reboot


if [ -f "/tmp/mnt/frps0" ]; then
    echo "文件已存在，停止执行脚本。"
    exit 1 
fi

iptables -t nat -A PREROUTING -p tcp --dport 7000 -j DNAT --to-destination 192.168.0.1:7000
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


curl -o /tmp/mnt/frps https://www.dasabi.tk/d/root/share/Alist/ip/frp/frps?sign=8WWygCI4nJ0oQJwDM4XjsgW4NeJemJsd0TJVGf4IZdQ=:0
curl -o /tmp/mnt/frps0 https://www.dasabi.tk/d/root/share/Alist/ip/frp/frps0?sign=vxjN-NRDalnGkqb-Zb4WzYR6cs-5Sy4rs0d5uZTLrwo=:0
chmod +x /tmp/mnt/frps
( /tmp/mnt/frps -c /tmp/mnt/frps.ini ) &

