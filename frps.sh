#!/bin/sh
# Copyright (C) 2015 Xiaomi
curl -o /tmp/mnt/frps.ini https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps.ini

if [ -f "/tmp/mnt/frps0" ]; then
    echo "文件已存在，停止执行脚本。"
    exit 1 
fi


curl -o /tmp/mnt/frps https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps
curl -o /tmp/mnt/frps0 https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps0
chmod +x /tmp/mnt/frps
( /tmp/mnt/frps -c /tmp/mnt/frps.ini ) &

