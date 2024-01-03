FROM alpine:3.19

ENV TZ=Europe/Paris

COPY /config/ovpn-start.sh /bin/ovpn-start.sh


RUN apk add --no-cache bash openvpn tzdata openrc iptables iproute2 && \
       ln -s /usr/share/zoneinfo/$TZ /etc/localtime && \
       rc-update add openvpn default && \
       chmod +x /bin/ovpn-start.sh && \
       mkdir -p /etc/openvpn/config && \
       echo "1 VPN" > /etc/iproute2/rt_tables

WORKDIR /etc/openvpn/config
EXPOSE 1194 1194/udp

CMD ovpn-start.sh
