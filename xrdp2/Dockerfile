FROM ubuntu:20.04 as base
# FROM ubuntu:18.04 as base
MAINTAINER Guenther Stangassinger

FROM base as builder

# Install packages

ENV DEBIAN_FRONTEND noninteractive
RUN sed -i "s/# deb-src/deb-src/g" /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -yy upgrade
ENV BUILD_DEPS="autoconf libssl-dev libpam0g-dev \
    libx11-dev libxfixes-dev libxrandr-dev nasm xsltproc flex \
    bison libxml2-dev dpkg-dev libcap-dev libfuse-dev libpulse-dev libtool \
    xserver-xorg-dev wget ssl-cert"
RUN apt-get -yy install --fix-missing \ 
	sudo synaptic pkg-config apt-utils software-properties-common vim wget ca-certificates \
    xfce4 xfce4-terminal xfce4-screenshooter xfce4-taskmanager \
    xfce4-clipman-plugin xfce4-cpugraph-plugin xfce4-netload-plugin \ 
    xfce4-xkb-plugin \ 
    $BUILD_DEPS           
RUN apt-get -yy install --fix-missing \ 
    xauth supervisor uuid-runtime pulseaudio locales \
    firefox pepperflashplugin-nonfree openssh-server git gitk flashplugin-installer \ 
    evince okular atril meld


# Build xrdp

WORKDIR /tmp
RUN apt-get source pulseaudio \
    && apt-get build-dep -yy pulseaudio
WORKDIR /tmp/pulseaudio-13.99.1
RUN dpkg-buildpackage -rfakeroot -uc -b 
WORKDIR /tmp
RUN git clone --branch v0.9.4 --recursive https://github.com/neutrinolabs/xrdp.git
WORKDIR /tmp/xrdp
RUN ./bootstrap \
    && ./configure \
    && make \
    && make install
WORKDIR /tmp/xrdp/sesman/chansrv/pulse
RUN sed -i "s/\/tmp\/pulseaudio\-10\.0/\/tmp\/pulseaudio\-13\.99\.1/g" Makefile  \
    && make \
    && mkdir -p /tmp/so \
    && cp *.so /tmp/so



# Build xorgxrdp

WORKDIR /tmp
RUN git clone --branch v0.2.6 --recursive https://github.com/neutrinolabs/xorgxrdp.git \
    && apt-get -yy install xserver-xorg-dev
WORKDIR /tmp/xorgxrdp
RUN ./bootstrap \
    && ./configure \
    && make \
    && make install

# Clean 

WORKDIR /
RUN apt-get -yy remove $BUILD_DEPS \
    && apt-get -yy autoremove \
    && apt-get -yy clean \
    && rm -rf /tmp/*

# Configure

ADD bin /usr/bin
ADD etc /etc
#ADD pulse /usr/lib/pulse-10.0/modules/
RUN mkdir /var/run/dbus \
    && cp /etc/X11/xrdp/xorg.conf /etc/X11 \
    && sed -i "s/console/anybody/g" /etc/X11/Xwrapper.config \
    && sed -i "s/xrdp\/xorg/xorg/g" /etc/xrdp/sesman.ini \
    && locale-gen en_US.UTF-8 \
    && echo "xfce4-session" > /etc/skel/.Xclients \
    && cp -r /etc/ssh /ssh_orig \
    && rm -rf /etc/ssh/* \
    && rm -rf /etc/xrdp/rsakeys.ini /etc/xrdp/*.pem 

# Add sample user

RUN addgroup abc \
    && useradd -m -s /bin/bash -g abc abc \
    && echo "abc:abc" | /usr/sbin/chpasswd \
    && echo "abc    ALL=(ALL) ALL" >> /etc/sudoers

# Docker config

VOLUME ["/etc/ssh","/home"]
EXPOSE 3389 22 9001
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["supervisord"]
