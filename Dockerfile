FROM alpine:latest

MAINTAINER Bart Kastermans <kasterma@kasterma.net>

ADD files/tarsnap-autoconf-1.0.37.tgz /

RUN apk update && \
    apk add gcc make libc-dev openssl-dev zlib-dev e2fsprogs-dev \
    && rm -rf /tmp/* /var/cache/apk/* \
    && cd tarsnap-autoconf-1.0.37 \
    && ./configure \
    && make all \
    && make install \
    && apk del gcc make libc-dev openssl-dev zlib-dev e2fsprogs-dev

# I have combined the following steps with the apk del followed to shrink the
# image.  After this move the image was 25MB, before 116MB.
# WORKDIR tarsnap-autoconf-1.0.37
# RUN ./configure
# RUN make all
# RUN make install

ADD backup.sh /
ADD tarsnap.conf /usr/local/etc

CMD ["./backup.sh"]
