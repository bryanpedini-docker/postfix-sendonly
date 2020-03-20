FROM centos:8

LABEL maintainer="Bryan Pedini <b.pedini@bjphoster.com>"

RUN dnf makecache && \
    dnf install -y postfix && \
    dnf clean all

COPY data/conf/postfix/main.cf /etc/postfix/main.cf
COPY data/conf/docker/docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 25

ENTRYPOINT [ "/docker-entrypoint.sh" ]
