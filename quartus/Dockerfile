FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -yy install \
         geany pkg-config unzip tar
                      
         
         
ADD tmp /tmp
WORKDIR /tmp
RUN tar -xvf Quartus-lite-17.1.0.590-linux.tar
WORKDIR /tmp/components
RUN ./ModelSimSetup-17.1.0.590-linux.run     --accept_eula 1 \
             --mode unattended --unattendedmodeui none --installdir \
             /opt/altera_lite
RUN ./QuartusLiteSetup-17.1.0.590-linux.run  --accept_eula 1 \
             --mode unattended --unattendedmodeui none --installdir \
             /opt/altera_lite



