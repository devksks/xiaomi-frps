#!/bin/sh
# Copyright (C) 2015 Xiaomi

if [ -f "/tmp/mnt/frps" ]; then
    echo "/tmp/mnt/frps 文件已存在，停止执行脚本。"
    exit 1 
fi

curl -o /tmp/mnt/frps.ini https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps.ini
curl -o /tmp/mnt/frps https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps
chmod +x /tmp/mnt/frps
/tmp/mnt/frps -c /tmp/mnt/frps.ini

