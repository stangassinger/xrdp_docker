FROM ubuntu:22.04 as builder
MAINTAINER Guenther Stangassinger

# Install packages
# base taken from https://github.com/danielguerra69/ubuntu-xrdp
ENV DEBIAN_FRONTEND noninteractive
RUN sed -i "s/# deb-src/deb-src/g" /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -yy upgrade
ENV BUILD_DEPS="git autoconf pkg-config libssl-dev libpam0g-dev \
    libx11-dev libxfixes-dev libxrandr-dev nasm xsltproc flex \
    bison libxml2-dev dpkg-dev libcap-dev"
RUN apt-get -yy install  sudo apt-utils software-properties-common $BUILD_DEPS



FROM ubuntu:22.04


ENV DEBIAN_FRONTEND noninteractive
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

RUN cd /root && \
    sed -i 's/^#\s*\(deb.*partner\)$/\1/g' /etc/apt/sources.list && \
    sed -i 's/^#\s*\(deb.*restricted\)$/\1/g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -yqq locales  && \
    apt-get install -yqq \
        mate-desktop-environment-core \
        mate-themes \
        mate-accessibility-profiles \
        mate-applet-appmenu \
        mate-applet-brisk-menu \
        mate-applets \
        mate-applets-common \
        mate-calc \
        mate-calc-common \
        mate-dock-applet \
        mate-hud \
        mate-indicator-applet \
        mate-indicator-applet-common \
        mate-menu \
        mate-notification-daemon \
        mate-notification-daemon-common \
        mate-utils \
        mate-utils-common \
        mate-window-applets-common \
        mate-window-buttons-applet \
        mate-window-menu-applet \
        mate-window-title-applet \
        ubuntu-mate-icon-themes \
        ubuntu-mate-themes \
        tightvncserver \
        pulseaudio && \
    apt-get install --no-install-recommends -yqq \
        supervisor \
        sudo \
        tzdata \
        vim \
        mc \
        ca-certificates \
        xterm \
        curl \
        wget \
        wmctrl \
        epiphany-browser && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata && \
    apt-get -y install \
        git \
        libxfont-dev \
        xserver-xorg-core \
        libx11-dev \
        libxfixes-dev \
        libssl-dev \
        libpam0g-dev \
        libtool \
        libjpeg-dev \
        flex \
        bison \
        gettext \
        autoconf \
        libxml-parser-perl \
        libfuse-dev \
        xsltproc \
        libxrandr-dev \
        python3-libxml2 \
        nasm \
        xserver-xorg-dev \
        fuse \
        build-essential \
        pkg-config \
        libpulse-dev m4 intltool dpkg-dev \
        libfdk-aac-dev \
        libopus-dev \
        libmp3lame-dev \
        xorgxrdp \
        xrdp && \
    #apt-get update && apt build-dep pulseaudio -y && \
    #cd /tmp && apt source pulseaudio && \
    #pulseaudio --version && \
    #pulsever=$(pulseaudio --version | awk '{print $2}') && cd /tmp/pulseaudio-$pulsever && ./configure  && \
    #git clone https://github.com/neutrinolabs/pulseaudio-module-xrdp.git && cd pulseaudio-module-xrdp && ./bootstrap && ./configure PULSE_DIR="/tmp/pulseaudio-$pulsever" && make -j$(nproc) && \
    #cd /tmp/pulseaudio-$pulsever/pulseaudio-module-xrdp/src/.libs && install -t "/var/lib/xrdp-pulseaudio-installer" -D -m 644 *.so  && \
    #cd /root && \
    ##git clone -b master https://github.com/neutrinolabs/xrdp.git && \
    ##git clone -b master https://github.com/neutrinolabs/xorgxrdp.git && \
    #git clone -b devel https://github.com/neutrinolabs/xrdp.git && \
    #git clone -b devel https://github.com/neutrinolabs/xorgxrdp.git && \
    #cd /root/xrdp && ./bootstrap && ./configure --enable-fuse --enable-jpeg --enable-vsock --enable-fdkaac --enable-opus --enable-mp3lame --enable-pixman && make -j$(nproc) && make install && \
    #cd /root/xorgxrdp  && ./bootstrap && ./configure && make -j$(nproc) && make install && \
    #cd /root && \
    #rm -R /root/xrdp && \
    #rm -R /root/xorgxrdp && \
    ## bugfix clipboard bug: [xrdp-chansrv] <defunct> && \
    #apt-mark manual libfdk-aac1 && \
    #apt-get -y purge \
    #    git \
    #    libxfont-dev \
    #    libx11-dev \
    #    libxfixes-dev \
    #    libssl-dev \
    #    libpam0g-dev \
    #    libtool \
    #    libjpeg-dev \
    #    flex \
    #    bison \
    #    gettext \
    #    autoconf \
    #    libxml-parser-perl \
    #    libfuse-dev \
    #    xsltproc \
    #    libxrandr-dev \
    #    python-libxml2 \
    #    nasm \
    #    xserver-xorg-dev \
    #    build-essential \
    #    pkg-config \
    #    libfdk-aac-dev \
    #    libopus-dev \
    #    libmp3lame-dev && \
    #    #        fuse \
    apt-get -y autoclean && apt-get -y autoremove && \
    apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
    rm -rf /var/lib/apt/lists/*
    
RUN echo "mate-session" > /etc/skel/.xsession && \
    sed -i '/TerminalServerUsers/d' /etc/xrdp/sesman.ini  && \
    sed -i '/TerminalServerAdmins/d' /etc/xrdp/sesman.ini  && \
    sed -i -e '/DisconnectedTimeLimit=/ s/=.*/=0/' /etc/xrdp/sesman.ini && \
    sed -i -e '/IdleTimeLimit=/ s/=.*/=0/' /etc/xrdp/sesman.ini && \
    xrdp-keygen xrdp auto  && \
    mkdir -p /var/run/xrdp && \
    chmod 2775 /var/run/xrdp  && \
    mkdir -p /var/run/xrdp/sockdir && \
    chmod 3777 /var/run/xrdp/sockdir && \
    touch /etc/skel/.Xauthority && \
    mkdir /run/dbus/ && chown messagebus:messagebus /run/dbus/ && \
    #dbus-uuidgen > /etc/machine-id && \
    #ln -sf /var/lib/dbus/machine-id /etc/machine-id && \  
    echo "[program:xrdp-sesman]" > /etc/supervisor/conf.d/xrdp.conf && \
    echo "command=/usr/sbin/xrdp-sesman --nodaemon" >> /etc/supervisor/conf.d/xrdp.conf && \
    echo "process_name = xrdp-sesman" >> /etc/supervisor/conf.d/xrdp.conf && \
    echo "[program:xrdp]" >> /etc/supervisor/conf.d/xrdp.conf && \
    echo "command=/usr/sbin/xrdp -nodaemon" >> /etc/supervisor/conf.d/xrdp.conf && \
    echo "process_name = xrdp" >> /etc/supervisor/conf.d/xrdp.conf
#RUN     echo "[program:dbus-daemon]" > /etc/supervisor/conf.d/dbus-daemon.conf && \
#    echo "command=/usr/bin/dbus-daemon --system --nofork" >> /etc/supervisor/conf.d/dbus-daemon.conf && \
#    echo "process_name = dbus-daemon" >> /etc/supervisor/conf.d/dbus-daemon.conf && \
#    echo "user = messagebus"  >> /etc/supervisor/conf.d/dbus-daemon.conf

ADD bin /usr/bin
ADD etc /etc

COPY xrdp.ini /etc/xrdp/xrdp.ini

COPY autostartup.sh /root/
CMD ["/bin/bash", "/root/autostartup.sh"]
                                    


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
ADD --chown=abc:abc  restoreXfce.sh  /home/abc
