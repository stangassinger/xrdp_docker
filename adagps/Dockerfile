FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -yy install \
         geany make pkg-config libgtk-3-dev
                      
         
         

#download and install adacore gps
WORKDIR /tmp                                
RUN wget  "http://mirrors.cdn.adacore.com/art/591c6d80c7a447af2deed1d7"
RUN wget  "http://mirrors.cdn.adacore.com/art/592c5299c7a447388d5c991d"
RUN wget  "http://mirrors.cdn.adacore.com/art/591af522c7a4473fcbb15524"

RUN mv 591c6d80c7a447af2deed1d7 gps.tar.gz
RUN mv 592c5299c7a447388d5c991d spark.tar.gz
RUN mv 591af522c7a4473fcbb15524 gtk.tar.gz

RUN tar xfz gps.tar.gz
RUN tar xfz spark.tar.gz
RUN tar xfz gtk.tar.gz

ADD tmp /tmp

RUN mv /tmp/doinstall /tmp/gnat-gpl-2017-x86_64-linux-bin
WORKDIR /tmp/gnat-gpl-2017-x86_64-linux-bin
RUN ./doinstall

RUN mv /tmp/doinstall_spark /tmp/spark-discovery-gpl-2017-x86_64-linux-bin/doinstall
WORKDIR /tmp/spark-discovery-gpl-2017-x86_64-linux-bin
RUN ./doinstall

RUN mv /tmp/doinstall_gtkada /tmp/gtkada-gpl-2017-x86_64-linux-bin/doinstall
WORKDIR /tmp/gtkada-gpl-2017-x86_64-linux-bin
RUN PATH=/usr/gnat/bin:$PATH  ./doinstall

