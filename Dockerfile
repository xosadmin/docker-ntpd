FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt install ntp -y

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "server 0.pool.ntp.org iburst" >> /etc/ntp.conf && \
    echo "server 1.pool.ntp.org iburst" >> /etc/ntp.conf && \
    echo "server 2.pool.ntp.org iburst" >> /etc/ntp.conf && \
    echo "server 3.pool.ntp.org iburst" >> /etc/ntp.conf

EXPOSE 123/udp

CMD ["/usr/sbin/ntpd", "-d"]