FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -y update --fix-missing
RUN apt-get -yy install default-jre 
RUN apt-get -yy install \
         geany geany-plugin-addons geany-plugin-automark make unzip expect wget

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

### download and install adacore gps 2017
### WORKDIR /tmp
### RUN wget  "http://mirrors.cdn.adacore.com/art/591c6413c7a447af2deed0e3"
### RUN mv 591c6413c7a447af2deed0e3 gps.tar.gz
### RUN tar xfz gps.tar.gz

### ADD tmp /tmp
### RUN mv /tmp/doinstall /tmp/gnat-gpl-2017-arm-elf-linux-bin
### WORKDIR /tmp/gnat-gpl-2017-arm-elf-linux-bin
### RUN ./doinstall
### 
### ENV PATH="/usr/gnat/bin:/usr/local/bin:${PATH}"


### download and install adacore gps 2019
WORKDIR /tmp
RUN git clone https://github.com/AdaCore/gnat_community_install_script.git
RUN cd gnat_community_install_script 
RUN wget https://community.download.adacore.com/v1/0cd3e2a668332613b522d9612ffa27ef3eb0815b?filename=gnat-community-2019-20190517-x86_64-linux-bin -O ./gnat-gps-installation
WORKDIR /tmp/gnat_community_install_script
RUN sh install_package.sh ../gnat-gps-installation /opt/GNAT/2019
WORKDIR /tmp
RUN cd gnat_community_install_script 
RUN wget  https://community.download.adacore.com/v1/6696259f92b40178ab1cc1d3e005acf705dc4162?filename=gnat-community-2019-20190517-arm-elf-linux64-bin -O ./gnat-gps-arm-installation
WORKDIR /tmp/gnat_community_install_script
RUN sh install_package.sh ../gnat-gps-arm-installation /opt/GNAT/2019-arm-elf
##########
#cube tmp/st_tooling02/cubemx
ADD tmp/st_tooling02/cubemx/cubemx-aa          /tmp/cubemx-aa 
ADD tmp/st_tooling02/cubemx/cubemx-ab          /tmp/cubemx-ab 
ADD tmp/st_tooling02/cubemx/cubemx-ac          /tmp/cubemx-ac 
ADD tmp/st_tooling02/cubemx/cubemx-ad          /tmp/cubemx-ad 
ADD tmp/st_tooling02/cubemx/cubemx-ae          /tmp/cubemx-ae 
ADD tmp/auto-install.xml /tmp/auto-install.xml
WORKDIR /tmp
RUN cat cubemx-* > cubemx.zip 
RUN unzip cubemx.zip
RUN java -jar ./SetupSTM32CubeMX-5.6.1.exe  auto-install.xml
#cubeide tmp/st_tooling02/cubeide
ADD tmp/st_tooling02/cubeide/cubeide-aa          /tmp/cubeide-aa 
ADD tmp/st_tooling02/cubeide/cubeide-ab          /tmp/cubeide-ab 
ADD tmp/st_tooling02/cubeide/cubeide-ac          /tmp/cubeide-ac 
ADD tmp/st_tooling02/cubeide/cubeide-ad          /tmp/cubeide-ad 
ADD tmp/st_tooling02/cubeide/cubeide-ae          /tmp/cubeide-ae 
ADD tmp/st_tooling02/cubeide/cubeide-af          /tmp/cubeide-af 
ADD tmp/st_tooling02/cubeide/cubeide-ag          /tmp/cubeide-ag 
ADD tmp/st_tooling02/cubeide/cubeide-ah          /tmp/cubeide-ah 
ADD tmp/st_tooling02/cubeide/cubeide-ai          /tmp/cubeide-ai 
ADD tmp/st_tooling02/cubeide/cubeide-aj          /tmp/cubeide-aj 
ADD tmp/st_tooling02/cubeide/cubeide-ak          /tmp/cubeide-ak 
ADD tmp/st_tooling02/cubeide/cubeide-al          /tmp/cubeide-al 
ADD tmp/st_tooling02/cubeide/cubeide-am          /tmp/cubeide-am 
ADD tmp/st_tooling02/cubeide/cubeide-an          /tmp/cubeide-an 
ADD tmp/st_tooling02/cubeide/cubeide-ao          /tmp/cubeide-ao 
ADD tmp/st_tooling02/cubeide/cubeide-ap          /tmp/cubeide-ap 
ADD tmp/st_tooling02/cubeide/cubeide-aq          /tmp/cubeide-aq 
ADD tmp/install_automatic_cubeide.sh           /tmp/install_automatic_cubeide.sh
WORKDIR /tmp
RUN cat cubeide-* > cubeide.zip 
RUN unzip cubeide.zip
RUN chmod 777 ./st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.deb_bundle.sh
RUN expect ./install_automatic_cubeide.sh
##########
#than copy /tmp/gps_arm.desktop to /home/abc/Desktop
#does not work by script :-(

