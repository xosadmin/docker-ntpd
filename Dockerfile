FROM alpine:latest

RUN apk update && \
    apk add ca-certificates openntpd && \
    apk add --update tzdata

RUN rm -rf /var/cache/apk/*

RUN echo "listen on *" >> /etc/ntpd.conf && \
    echo "server 0.pool.ntp.org" >> /etc/ntpd.conf && \
    echo "server 1.pool.ntp.org" >> /etc/ntpd.conf && \
    echo "server 2.pool.ntp.org" >> /etc/ntpd.conf && \
    echo "server 3.pool.ntp.org" >> /etc/ntpd.conf

EXPOSE 123/udp

CMD ["/usr/sbin/ntpd", "-v", "-d"]