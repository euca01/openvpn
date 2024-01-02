#!/bin/sh
set -e



#mkdir -p /dev/net
#if [ ! -c /dev/net/tun ]; then
#	mknod /dev/net/tun c 10 200
#fi
#iptables -t nat -A POSTROUTING -j MASQUERADE
#iptables -A FORWARD -i tun0 -o tun0 -j DROP
exec openvpn --config config/config.conf