FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -yy install \
         geany pkg-config unzip
                      
         
         

#download and install android studio
WORKDIR /tmp                                
## RUN wget  "https://dl.google.com/dl/android/studio/ide-zips/3.1.0.16/android-studio-ide-173.4670197-linux.zip"
## RUN unzip  android-studio-ide-173.4670197-linux.zip

## RUN wget  "https://dl.google.com/dl/android/studio/ide-zips/3.1.2.0/android-studio-ide-173.4720617-linux.zip"
## RUN unzip  android-studio-ide-173.4720617-linux.zip


RUN wget  "https://dl.google.com/dl/android/studio/ide-zips/3.1.3.0/android-studio-ide-173.4819257-linux.zip"
RUN unzip  android-studio-ide-173.4819257-linux.zip

RUN mv /tmp/android-studio /opt

ADD tmp /tmp




