FROM ubuntu:22.04 AS builder
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential autoconf libtool-bin pkg-config \
  libcairo2-dev libjpeg-turbo8-dev libpng-dev libpango1.0-dev \
  libossp-uuid-dev libssh2-1-dev libtelnet-dev libvncserver-dev \
  libpulse-dev libssl-dev libvorbis-dev libwebp-dev \
  freerdp2-dev \
  libavcodec-dev libavformat-dev libavutil-dev libswscale-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY guacamole-server-1.5.5-douran.tar.gz .

RUN tar -xf guacamole-server-1.5.5-douran.tar.gz \
  && cd guacamole-server-* \
  && ./configure \
  && make -j"$(nproc)" \
  && make install \
  && ldconfig

FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  libcairo2 libjpeg-turbo8 libpng16-16 libpango-1.0-0 \
  libossp-uuid16 libssh2-1 libtelnet2 libvncserver1 \
  libpulse0 libssl3 libvorbis0a libwebp7 \
  freerdp2-x11 \
  libavcodec58 libavformat58 libavutil56 libswscale5 \
  tini \
  && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/ /usr/local/
RUN ldconfig

EXPOSE 4822
ENTRYPOINT ["/usr/bin/tini","--"]
CMD ["/usr/local/sbin/guacd","-f","-b","0.0.0.0","-l","4822"]
