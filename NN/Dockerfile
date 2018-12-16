FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -yy install \
         geany   python-scipy  python-pip curl
RUN pip install opencv-python
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
        

