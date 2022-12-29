FROM debian:11

MAINTAINER Солопов Никита гр. 728-1

COPY ./prog.cpp .
#COPY ./a.out .
#COPY ./lab2 .
COPY ./lab2.s .
COPY ./lab2_comments.s .

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt-get install gcc-multilib -y
RUN apt-get install gdb -y
