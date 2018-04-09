FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -yy install \
         geany make

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
         libsm6:i386 \
## needed for stlink
         build-essential \
         cmake \
         libusb-1.0-0-dev \
         usbutils
                      
         
         
WORKDIR /tmp
#download and install stlink
RUN git clone https://github.com/texane/stlink stlink
WORKDIR /tmp/stlink
RUN make release
WORKDIR /tmp/stlink/build/Release
RUN make install
RUN ldconfig /usr/local/lib/lib
## not working  RUN udevadm control --reload-rules

#download and install adacore gps
WORKDIR /tmp
RUN wget  "http://mirrors.cdn.adacore.com/art/591c6413c7a447af2deed0e3"
RUN mv 591c6413c7a447af2deed0e3 gps.tar.gz
RUN tar xfz gps.tar.gz

ADD tmp /tmp
RUN mv /tmp/doinstall /tmp/gnat-gpl-2017-arm-elf-linux-bin
WORKDIR /tmp/gnat-gpl-2017-arm-elf-linux-bin
RUN ./doinstall

ENV PATH="/usr/gnat/bin:/usr/local/bin:${PATH}"

#than copy /tmp/gps_arm.desktop to /home/abc/Desktop
#does not work by script :-(

