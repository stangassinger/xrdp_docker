FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN dpkg --add-architecture i386
RUN apt-get -y update
RUN apt-get -yy upgrade

RUN apt-get -yy install \ 
         libbz2-1.0:i386 \
         libsm6:i386 \
         libxrender1:i386 \
         libxinerama1:i386 \
         libncurses5:i386 \
         libc6:i386 \
         libsm6:i386 \
         libsm6:i386          
         
         
WORKDIR /tmp
RUN wget "http://mirrors.cdn.adacore.com/art/591c6413c7a447af2deed0e3"
RUN mv 591c6413c7a447af2deed0e3 gps.tar.gz
RUN tar xfz gps.tar.gz
RUN rm -rf /tmp/*
