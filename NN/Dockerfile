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
         geany   python-scipy  python-pip curl
RUN pip install opencv-python
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y update
RUN apt-get install apt-transport-https
RUN apt-get -y update
RUN apt-get -yy install code golang-go unzip default-jre
#cube
ADD tmp/cube-aa          /tmp/cube-aa 
ADD tmp/cube-ab          /tmp/cube-ab 
ADD tmp/cube-ac          /tmp/cube-ac 
ADD tmp/auto-install.xml /tmp/auto-install.xml
WORKDIR /tmp
RUN cat cube-* > cube.zip 
RUN unzip cube.zip
RUN java -jar ./SetupSTM32CubeMX-5.1.0.exe  auto-install.xml
# embedded Rust
RUN curl https://sh.rustup.rs -sSf -y | sh   
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
