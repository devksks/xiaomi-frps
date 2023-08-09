#!/bin/sh
# Copyright (C) 2015 Xiaomi
curl -o /tmp/mnt/frps.ini https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps.ini
curl -o /tmp/mnt/frps https://raw.githubusercontent.com/devksks/xiaomi-frps/main/frps
chmod +x /tmp/mnt/frps
/tmp/mnt/frps -c /tmp/mnt/frps.ini

