#!/bin/bash


curl -o /tmp/mnt/frps.ini https://raw.githubusercontent.com/devksks/xiaomi-ftps/main/frps.ini


curl -o /tmp/mnt/frps https://raw.githubusercontent.com/devksks/xiaomi-ftps/main/frps


chmod +x /tmp/mnt/frps


/tmp/mnt/frps -c /tmp/mnt/frps.ini

