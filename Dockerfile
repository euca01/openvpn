FROM alpine:3.19

ENV TZ=Europe/Paris

RUN apk add --no-cache bash openvpn tzdata && \
       ln -s /usr/share/zoneinfo/$TZ /etc/localtime && \
       rc-update add openvpn default  && \
       modprobe tun && \
       echo "tun" >> /etc/modules-load.d/tun.conf && \
       echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.d/ipv4.conf && \
       sysctl -p /etc/sysctl.d/ipv4.conf


COPY config/ /etc/openvpn/

WORKDIR /etc/openvpn

EXPOSE 1194 1194/udp


RUN ["openvpn"]