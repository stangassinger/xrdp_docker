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
         gitk geany  gedit  python3-scipy  python3-pip curl geany-plugin-addons  geany-plugin-automark make unzip expect wget
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y update
RUN apt-get install apt-transport-https
RUN apt-get -y update
RUN apt-get -yy install git code golang-go unzip default-jre  gcc-arm-none-eabi
#gdbgui
RUN apt-get update && apt-get install -y \
	libncurses5 \
	python3-pip \
	net-tools \
	can-utils \
	python-is-python3 \
	wget 	
RUN python3 -m pip install --upgrade pip        
## tis does not run anymore !!   RUN pip3 install opencv-python	
RUN pip3 install --upgrade setuptools \
    && pip3 install eventlet gevent gevent-websocket \
&& pip3 install 'gdbgui==0.13.1.1'
## install clang and codechecker; https://codechecker.readthedocs.io
RUN apt-get install -y clang clang-tidy clang-tools build-essential curl doxygen \
      gcc-multilib  python3-virtualenv python3-dev tio
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN git clone https://github.com/Ericsson/CodeChecker.git --depth 1  /codechecker
WORKDIR /codechecker
############# check if this line is needed -->RUN git checkout ${master}
RUN git checkout ${master}
#############       RUN make -C /codechecker/web package

#########   RUN make venv
ARG INSTALL_AUTH=yes
ARG INSTALL_PG8000=no
ARG INSTALL_PSYCOPG2=yes

ENV TINI_VERSION v0.18.0

RUN set -x && apt-get update -qq \
  # Prevent fail when install postgresql-client.
  && mkdir -p /usr/share/man/man1 \
  && mkdir -p /usr/share/man/man7 \
  \
  && apt-get install -qqy --no-install-recommends ca-certificates \
    postgresql-client \
    # To switch user and exec command.
    gosu

RUN if [ "$INSTALL_AUTH" = "yes" ] ; then \
      apt-get install -qqy --no-install-recommends \
        libldap2-dev \
        libsasl2-dev \
        libssl-dev; \
    fi

RUN if [ "$INSTALL_PSYCOPG2" = "yes" ] ; then \
      apt-get install -qqy --no-install-recommends \
        libpq-dev; \
    fi

RUN groupadd -r codechecker -g 950 \
  && useradd -r --no-log-init -M -u 950 -g codechecker codechecker
RUN chown codechecker:codechecker /codechecker
ENV PATH="/codechecker/bin:$PATH"

#cube tmp/st_tooling03/cubemx
ADD tmp/st_tooling03/cubemx/cubemx-aa          /tmp/cubemx-aa 
ADD tmp/st_tooling03/cubemx/cubemx-ab          /tmp/cubemx-ab 
ADD tmp/st_tooling03/cubemx/cubemx-ac          /tmp/cubemx-ac 
ADD tmp/st_tooling03/cubemx/cubemx-ad          /tmp/cubemx-ad 
ADD tmp/st_tooling03/cubemx/cubemx-ae          /tmp/cubemx-ae 
ADD tmp/st_tooling03/cubemx/cubemx-af          /tmp/cubemx-af
ADD tmp/st_tooling03/cubemx/cubemx-ag          /tmp/cubemx-ag
ADD tmp/st_tooling03/cubemx/cubemx-ah          /tmp/cubemx-ah
ADD tmp/st_tooling03/cubemx/cubemx-ai          /tmp/cubemx-ai
ADD tmp/st_tooling03/cubemx/cubemx-aj          /tmp/cubemx-aj
ADD tmp/auto-install.xml /tmp/auto-install.xml
WORKDIR /tmp
RUN cat cubemx-* > cubemx.zip 
RUN unzip cubemx.zip
RUN java -jar ./SetupSTM32CubeMX-6.5.0  auto-install.xml
#cubeide tmp/st_tooling03/cubeide
ADD tmp/st_tooling03/cubeide/cubeide-aa          /tmp/cubeide-aa 
ADD tmp/st_tooling03/cubeide/cubeide-ab          /tmp/cubeide-ab 
ADD tmp/st_tooling03/cubeide/cubeide-ac          /tmp/cubeide-ac 
ADD tmp/st_tooling03/cubeide/cubeide-ad          /tmp/cubeide-ad 
ADD tmp/st_tooling03/cubeide/cubeide-ae          /tmp/cubeide-ae 
ADD tmp/st_tooling03/cubeide/cubeide-af          /tmp/cubeide-af 
ADD tmp/st_tooling03/cubeide/cubeide-ag          /tmp/cubeide-ag 
ADD tmp/st_tooling03/cubeide/cubeide-ah          /tmp/cubeide-ah 
ADD tmp/st_tooling03/cubeide/cubeide-ai          /tmp/cubeide-ai 
ADD tmp/st_tooling03/cubeide/cubeide-aj          /tmp/cubeide-aj 
ADD tmp/st_tooling03/cubeide/cubeide-ak          /tmp/cubeide-ak 
ADD tmp/st_tooling03/cubeide/cubeide-al          /tmp/cubeide-al 
ADD tmp/st_tooling03/cubeide/cubeide-am          /tmp/cubeide-am 
ADD tmp/st_tooling03/cubeide/cubeide-an          /tmp/cubeide-an 
ADD tmp/st_tooling03/cubeide/cubeide-ao          /tmp/cubeide-ao 
ADD tmp/st_tooling03/cubeide/cubeide-ap          /tmp/cubeide-ap 
ADD tmp/st_tooling03/cubeide/cubeide-aq          /tmp/cubeide-aq 
ADD tmp/st_tooling03/cubeide/cubeide-ar          /tmp/cubeide-ar 
ADD tmp/st_tooling03/cubeide/cubeide-as          /tmp/cubeide-as 
ADD tmp/st_tooling03/cubeide/cubeide-at          /tmp/cubeide-at 
ADD tmp/install_automatic_cubeide.sh           /tmp/install_automatic_cubeide.sh
WORKDIR /tmp
RUN cat cubeide-* > cubeide.zip 
RUN unzip cubeide.zip
RUN ls -la
RUN chmod 777 ./st-stm32cubeide_1.9.0_12015_20220302_0855_amd64.deb_bundle.sh              
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

