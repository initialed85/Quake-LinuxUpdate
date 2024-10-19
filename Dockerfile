ARG DEBUG

FROM --platform=linux/i386 i386/ubuntu:18.04 AS builder

RUN apt-get update && apt-get install -y \
    build-essential git libsdl2-dev libsdl2-2.0-0 \
    libjpeg-dev libwebp-dev libtiff5-dev libsdl2-image-dev libsdl2-image-2.0-0 \
    libmikmod-dev libfishsound1-dev libsmpeg-dev liboggz2-dev libflac-dev \
    libfluidsynth-dev libsdl2-mixer-dev libsdl2-mixer-2.0-0 libxxf86dga1 libgbm-dev

WORKDIR /srv/

COPY WinQuake /srv/Quake-LinuxUpdate/WinQuake

WORKDIR /srv/Quake-LinuxUpdate/WinQuake

ARG DEBUG
ENV DEBUG=${DEBUG}

RUN make -f Makefile.Linuxi386.X11 build_release

FROM --platform=linux/i386 i386/ubuntu:18.04

WORKDIR /srv/WinQuake

RUN apt-get update && apt-get install -y \
    libxxf86dga1 libsdl2-2.0-0 wget curl screen

RUN wget https://github.com/sorenisanerd/gotty/releases/download/v1.5.0/gotty_v1.5.0_linux_386.tar.gz
RUN tar -xzvf gotty_v1.5.0_linux_386.tar.gz

COPY --from=builder /srv/Quake-LinuxUpdate/WinQuake/id1/ /srv/WinQuake/id1/
COPY --from=builder /srv/Quake-LinuxUpdate/WinQuake/releasei386/bin/quake.x11 /srv/WinQuake/quake.x11

COPY ./mods/frikbot /srv/WinQuake/frikbot
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
