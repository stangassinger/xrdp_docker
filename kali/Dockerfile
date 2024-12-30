FROM kali_base

ARG DESKTOP_ENVIRONMENT
ARG REMOTE_ACCESS
ARG KALI_PACKAGE
ARG SSH_PORT
ARG RDP_PORT
ARG VNC_PORT
ARG VNC_DISPLAY
ARG BUILD_ENV
ARG HOSTDIR
ARG CONTAINERDIR
ARG UNAME
ARG UPASS

ADD --chown=${UNAME}:${UPASS}  restoreXfce.sh  /home/${UNAME}/Desktop/restoreXfce.sh
RUN echo '[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=restore\n\
Comment=\n\
Exec=sh -c "./restoreXfce.sh"\n\
Icon=\n\
Path=\n\
Terminal=true\n\
StartupNotify=true' > /home/${UNAME}/Desktop/restore.desktop
RUN chmod 777 /home/${UNAME}/Desktop/restore.desktop
RUN apt update
RUN apt full-upgrade -y
RUN apt update
RUN apt -y install kali-linux-headless
RUN apt -y install xfce4-notifyd 

RUN apt-get -yy install \
         gitk geany  gedit  python3-scipy  curl geany-plugin-addons \
         geany-plugin-automark make unzip expect wget evince meld
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y update
RUN apt-get install apt-transport-https
RUN apt-get -y update
RUN apt-get -yy install git code golang-go unzip default-jre  gcc-arm-none-eabi
#gdbgui
RUN apt-get update && apt-get install -y \
	net-tools \
	can-utils \
	python-is-python3 \
	wget \
	nemo	
# RUN python -m pip install --upgrade pip        
## tis does not run anymore !!   RUN pip3 install opencv-python	
#
#cube tmp/st_tooling04/cubemx
ADD tmp/st_tooling04/cubemx/cubemx-aa          /tmp/cubemx-aa 
ADD tmp/st_tooling04/cubemx/cubemx-ab          /tmp/cubemx-ab 
ADD tmp/st_tooling04/cubemx/cubemx-ac          /tmp/cubemx-ac 
ADD tmp/st_tooling04/cubemx/cubemx-ad          /tmp/cubemx-ad 
ADD tmp/st_tooling04/cubemx/cubemx-ae          /tmp/cubemx-ae 
ADD tmp/st_tooling04/cubemx/cubemx-af          /tmp/cubemx-af
ADD tmp/st_tooling04/cubemx/cubemx-ag          /tmp/cubemx-ag
ADD tmp/st_tooling04/cubemx/cubemx-ah          /tmp/cubemx-ah
ADD tmp/st_tooling04/cubemx/cubemx-ai          /tmp/cubemx-ai
ADD tmp/st_tooling04/cubemx/cubemx-aj          /tmp/cubemx-aj
ADD tmp/st_tooling04/cubemx/cubemx-ak          /tmp/cubemx-ak
ADD tmp/st_tooling04/cubemx/cubemx-al          /tmp/cubemx-al
ADD tmp/auto-install.xml /tmp/auto-install.xml
WORKDIR /tmp
RUN cat cubemx-* > cubemx.zip 
RUN unzip cubemx.zip
RUN java -jar ./SetupSTM32CubeMX-6.7.0  auto-install.xml
#cubeide tmp/st_tooling04/cubeide
ADD tmp/st_tooling04/cubeide/cubeide-aa          /tmp/cubeide-aa 
ADD tmp/st_tooling04/cubeide/cubeide-ab          /tmp/cubeide-ab 
ADD tmp/st_tooling04/cubeide/cubeide-ac          /tmp/cubeide-ac 
ADD tmp/st_tooling04/cubeide/cubeide-ad          /tmp/cubeide-ad 
ADD tmp/st_tooling04/cubeide/cubeide-ae          /tmp/cubeide-ae 
ADD tmp/st_tooling04/cubeide/cubeide-af          /tmp/cubeide-af 
ADD tmp/st_tooling04/cubeide/cubeide-ag          /tmp/cubeide-ag 
ADD tmp/st_tooling04/cubeide/cubeide-ah          /tmp/cubeide-ah 
ADD tmp/st_tooling04/cubeide/cubeide-ai          /tmp/cubeide-ai 
ADD tmp/st_tooling04/cubeide/cubeide-aj          /tmp/cubeide-aj 
ADD tmp/st_tooling04/cubeide/cubeide-ak          /tmp/cubeide-ak 
ADD tmp/st_tooling04/cubeide/cubeide-al          /tmp/cubeide-al 
ADD tmp/st_tooling04/cubeide/cubeide-am          /tmp/cubeide-am 
ADD tmp/st_tooling04/cubeide/cubeide-an          /tmp/cubeide-an 
ADD tmp/st_tooling04/cubeide/cubeide-ao          /tmp/cubeide-ao 
ADD tmp/st_tooling04/cubeide/cubeide-ap          /tmp/cubeide-ap 
ADD tmp/st_tooling04/cubeide/cubeide-aq          /tmp/cubeide-aq 
ADD tmp/st_tooling04/cubeide/cubeide-ar          /tmp/cubeide-ar 
ADD tmp/st_tooling04/cubeide/cubeide-as          /tmp/cubeide-as 
ADD tmp/st_tooling04/cubeide/cubeide-at          /tmp/cubeide-at 
ADD tmp/st_tooling04/cubeide/cubeide-au          /tmp/cubeide-au 
ADD tmp/install_automatic_cubeide.sh           /tmp/install_automatic_cubeide.sh
WORKDIR /tmp
RUN cat cubeide-* > cubeide.zip 
RUN unzip cubeide.zip
RUN ls -la
RUN chmod 777 ./st-stm32cubeide_1.11.0_13638_20221122_1308_amd64.deb_bundle.sh              
RUN expect ./install_automatic_cubeide.sh
##########
## needed for stlink
RUN apt-get -yy install \ 
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
##########
# ada fsf
#RUN apt-get -yy install \
#                gnat \
#                gnat-7-arm-linux-gnueabi \
#                gnat-7-arm-linux-gnueabihf \
#                gcc-arm-linux-gnueabi \
#                gcc-arm-linux-gnueabihf \ 
#                gprbuild
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

########### start frama-c #############
###  install frama-c
###  sudo apt install opam
###  opam install depext
###  eval $(opam env --switch=default)
###  opam depext frama-c
###  opam install frama-c -y
###  opam install alt-ergo
###  eval $(opam env) 
###  why3 config detect
###  frama-c-gui -wp -rte main.c
#
RUN apt -yy install opam 
RUN apt -yy install autoconf graphviz \
                     libcairo2-dev libgmp-dev \
                     libgtk-3-dev libgtksourceview-3.0-dev
# USER abc
# ENV HOME /home/abc
# ENV OPAMYES 1
# WORKDIR /home/abc
# USER abc
# RUN opam init --disable-sandboxing && \
# #  opam switch create system ocaml-system && \
#   eval $(opam env --switch=default) && \
#   opam install frama-c -y && \
#   opam install alt-ergo
########### end frama-c #############

