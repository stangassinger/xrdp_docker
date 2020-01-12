FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -y update
RUN apt-get -yy install aptitude
RUN apt-get -y update
RUN aptitude safe-upgrade -yy
RUN apt-get -y update
RUN apt-get -yy install \
         geany  gedit  python-scipy  python-pip curl
RUN pip install opencv-python
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y update
RUN apt-get install apt-transport-https
RUN apt-get -y update
RUN apt-get -yy install code golang-go unzip default-jre  gcc-arm-none-eabi
#gdbgui
RUN apt-get update && apt-get install -y \
	libncurses5 \
	python3.7-minimal \
	python3-pip \
	wget 	
RUN pip3 install --upgrade setuptools \
    && pip3 install eventlet gevent gevent-websocket \
&& pip3 install 'gdbgui==0.13.1.1'
#cube tmp/st_tooling/cubemx
ADD tmp/st_tooling/cubemx/cubemx-aa          /tmp/cubemx-aa 
ADD tmp/st_tooling/cubemx/cubemx-ab          /tmp/cubemx-ab 
ADD tmp/st_tooling/cubemx/cubemx-ac          /tmp/cubemx-ac 
ADD tmp/st_tooling/cubemx/cubemx-ad          /tmp/cubemx-ad 
ADD tmp/st_tooling/cubemx/cubemx-ae          /tmp/cubemx-ae 
ADD tmp/auto-install.xml /tmp/auto-install.xml
WORKDIR /tmp
RUN cat cubemx-* > cubemx.zip 
RUN unzip cubemx.zip
RUN java -jar ./SetupSTM32CubeMX-5.5.0.exe  auto-install.xml
#cubeide tmp/st_tooling/cubeide
ADD tmp/st_tooling/cubeide/cubeide-aa          /tmp/cubeide-aa 
ADD tmp/st_tooling/cubeide/cubeide-ab          /tmp/cubeide-ab 
ADD tmp/st_tooling/cubeide/cubeide-ac          /tmp/cubeide-ac 
ADD tmp/st_tooling/cubeide/cubeide-ad          /tmp/cubeide-ad 
ADD tmp/st_tooling/cubeide/cubeide-ae          /tmp/cubeide-ae 
ADD tmp/st_tooling/cubeide/cubeide-af          /tmp/cubeide-af 
ADD tmp/st_tooling/cubeide/cubeide-ag          /tmp/cubeide-ag 
ADD tmp/st_tooling/cubeide/cubeide-ah          /tmp/cubeide-ah 
ADD tmp/st_tooling/cubeide/cubeide-ai          /tmp/cubeide-ai 
ADD tmp/st_tooling/cubeide/cubeide-aj          /tmp/cubeide-aj 
ADD tmp/st_tooling/cubeide/cubeide-ak          /tmp/cubeide-ak 
ADD tmp/st_tooling/cubeide/cubeide-al          /tmp/cubeide-al 
ADD tmp/st_tooling/cubeide/cubeide-am          /tmp/cubeide-am 
ADD tmp/st_tooling/cubeide/cubeide-an          /tmp/cubeide-an 
ADD tmp/st_tooling/cubeide/cubeide-ao          /tmp/cubeide-ao 
ADD tmp/st_tooling/cubeide/cubeide-ap          /tmp/cubeide-ap 
ADD tmp/st_tooling/cubeide/cubeide-aq          /tmp/cubeide-aq 
WORKDIR /tmp
RUN cat cubeide-* > cubeide.zip 
RUN unzip cubeide.zip
# ada fsf
RUN apt-get -yy install \
                gnat \
                gnat-7-arm-linux-gnueabi \
                gnat-7-arm-linux-gnueabihf \
                gcc-arm-linux-gnueabi \
                gcc-arm-linux-gnueabihf \ 
                gprbuild
RUN curl -sSf https://sh.rustup.rs | sh -s -- -y 
RUN apt-get -yy install \
#         cargo \    
          gdb-multiarch \
          openocd \
          binutils \
          usbutils \
          minicom 
RUN echo '# FT232 - USB <-> Serial Converter \n \
ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE:="0666"' \
      > /etc/udev/rules.d/99-ftdi.rules
RUN echo '# STM32F3DISCOVERY rev A/B - ST-LINK/V2\n \
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE:="0666"\n \
# STM32F3DISCOVERY rev C+ - ST-LINK/V2-1\n \
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", MODE:="0666"' \         
        > /etc/udev/rules.d/99-openocd.rules
        
RUN apt-get -y update
