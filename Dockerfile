FROM alpine:latest

RUN apk update && apk add openntpd

RUN rm -rf /var/cache/apk/*

RUN echo "server 0.pool.ntp.org" >> /etc/ntpd.conf && \
    echo "server 1.pool.ntp.org" >> /etc/ntpd.conf && \
    echo "server 2.pool.ntp.org" >> /etc/ntpd.conf && \
    echo "server 3.pool.ntp.org" >> /etc/ntpd.conf

EXPOSE 123/udp

CMD ["openntpd", "-f", "/etc/ntpd.conf", "-d"]