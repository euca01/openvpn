FROM alpine:3.19

ENV TZ=Europe/Paris

RUN apk add --no-cache bash openvpn tzdata openrc && \
       ln -s /usr/share/zoneinfo/$TZ /etc/localtime && \
       rc-update add openvpn default && \
       echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.d/ipv4.conf && \
       sysctl -p /etc/sysctl.d/ipv4.conf


WORKDIR /etc/openvpn

EXPOSE 1194 1194/udp


RUN ["openvpn", "--config", "config.conf"]