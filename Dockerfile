FROM ubuntu-debootstrap:14.04

RUN apt-get update && apt-get install build-essential unzip git python -y ; apt-get clean

ADD  http://simh.trailing-edge.com/sources/simhv39-0.zip /simhv39-0.zip

RUN mkdir /simhv && cd /simhv && unzip ../simhv39-0.zip && make pdp11

RUN git clone https://github.com/c3x04/Unix-1st-Edition-jun72.git /Unix-1st-Edition-jun72 && mv /simhv/BIN/pdp11 Unix-1st-Edition-jun72/tools/

RUN cd /Unix-1st-Edition-jun72 && make

ENTRYPOINT ["/bin/bash","-c","cd /Unix-1st-Edition-jun72 ;./simh.cfg"]

EXPOSE 5555
