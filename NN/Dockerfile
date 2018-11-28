FROM xrdp2
MAINTAINER Guenther Stangassinger

RUN apt-get -y update
RUN apt-get -yy upgrade
RUN apt-get -yy install \
         geany   python-scipy curl
RUN curl https://sh.rustup.rs -sSf -y | sh   
RUN apt-get -yy install cargo      
                      
         
        

