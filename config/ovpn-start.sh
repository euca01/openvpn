#!/bin/sh
set -e

if [ -z $* ]; then
	param=--config server.conf
else
	param=$*
fi
echo "OpenVPN parameters: $param"

mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
	mknod /dev/net/tun c 10 200
fi
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A FORWARD -i tun0 -o tun0 -j DROP
exec openvpn $param