FROM ubuntu:16.04
LABEL maintainer="Martin Mirchev <mmirchev@comp.nus.edu.sg>"

RUN apt update && apt upgrade -y && apt-get autoremove -y

RUN apt install -y gcc g++ wget curl cmake git software-properties-common llvm-3.6* libgmp-dev liblzma-dev zlib1g-dev libedit-dev clang-3.6

RUN ln -s /usr/bin/llvm-config-3.6  /usr/bin/llvm-config


RUN mkdir /opt/llvm2kittel

COPY . /opt/llvm2kittel/

WORKDIR /opt/llvm2kittel/

RUN mkdir build && cd build && cmake .. && make 
