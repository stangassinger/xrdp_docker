# quartus does not work on ubuntu 18.04
# therefore ubuntu 16.04 must be taken
FROM xrdp1     
MAINTAINER Guenther Stangassinger

RUN apt-add-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe"
RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -yy install \
         geany geany-plugin-addons pkg-config unzip tar  
RUN  dpkg --add-architecture i386 && \
     apt-get update && \
     apt-get -yy install build-essential && \
     apt-get -yy install gcc-multilib g++-multilib \
     lib32z1 lib32stdc++6 lib32gcc1 \
     expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libc6:i386 libgtk-3-0:i386 \
     libcanberra0:i386 libpng12-0:i386 libice6:i386 libsm6:i386 libncurses5:i386 zlib1g:i386 \
     libx11-6:i386 libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 \
     libxt6:i386 libxtst6:i386
ADD tmp /tmp
WORKDIR /tmp
RUN wget http://download.altera.com/akdlm/software/acdsinst/17.1std.1/593/ib_tar/Quartus-lite-17.1.1.593-linux.tar
RUN tar xvf Quartus-lite-17.1.1.593-linux.tar
WORKDIR /tmp/components
RUN ./ModelSimSetup-17.1.0.590-linux.run     --accept_eula 1 \
             --mode unattended --unattendedmodeui none --installdir \
             /opt/altera_lite
RUN ./QuartusLiteSetup-17.1.0.590-linux.run  --accept_eula 1 \
             --mode unattended --unattendedmodeui none --installdir \
             /opt/altera_lite

RUN cp /tmp/vsim /opt/altera_lite/modelsim_ase/bin/

