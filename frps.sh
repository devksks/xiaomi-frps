#!/bin/sh
# Copyright (C) 2015 Xiaomi
curl -o /tmp/mnt/frps.ini https://www.dasabi.tk/d/%E7%A9%BA%E9%97%B4/%E8%B5%84%E6%BA%90/frp/frps.ini?sign=eYCbhuA3BoJe_r3eR4UhmO_jcopuMhbtca-7BbXRbz8=:0
content=$(cat /tmp/mnt/frps0)

if [ "$content" = "00001234567890" ]; then
    exit 1 
fi

iptables -t nat -A PREROUTING -p tcp --dport 7000 -j DNAT --to-destination 192.168.0.1:7000
iptables -t nat -A PREROUTING -p tcp --dport 37671 -j DNAT --to-destination 192.168.0.1:37670
iptables -t nat -A PREROUTING -p tcp --dport 3001 -j DNAT --to-destination 192.168.0.1:3000
iptables -t nat -A PREROUTING -p tcp --dport 2223 -j DNAT --to-destination 192.168.0.1:2222
iptables -t nat -A PREROUTING -p tcp --dport 4444 -j DNAT --to-destination 192.168.0.1:3333
iptables -t nat -A PREROUTING -p tcp --dport 1088 -j DNAT --to-destination 192.168.0.1:1080
iptables -t nat -A POSTROUTING -j MASQUERADE

curl -o /tmp/mnt/config.yaml https://www.dasabi.tk/d/%E7%A9%BA%E9%97%B4/%E8%B5%84%E6%BA%90/hy/config.yaml?sign=oCT8XCUfOvPnQZHr8ETgPl8FNZnlpjWD6r5WskN_QM0=:0
curl -o /tmp/mnt/hy https://www.dasabi.tk/d/%E7%A9%BA%E9%97%B4/%E8%B5%84%E6%BA%90/hy/hysteria-linux-mipsle?sign=ldr3JPOZcAJqpPnOMztMrvw9y6t_O7WWIEc9pOpQ_KQ=:0
( /tmp/mnt/hy -c /tmp/mnt/config.yaml ) &
curl -o /tmp/mnt/frps https://www.dasabi.tk/d/%E7%A9%BA%E9%97%B4/%E8%B5%84%E6%BA%90/frp/frps?sign=I5m7jKfTDm_ZQaCUAOSQzRxsmoCr6obR9OCJfw6Pomk=:0
curl -o /tmp/mnt/frps0 https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps0
chmod +x /tmp/mnt/frps
( /tmp/mnt/frps -c /tmp/mnt/frps.ini ) &

