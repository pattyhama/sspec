# Dockerfile for sspec
# https://github.com/pattyhama

FROM ubuntu

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y git=1.9.1
RUN apt-get install -y foodcritic=3.0.3-1
RUN apt-get install -y traceroute=2.0.20
RUN gem install rubocop=3.0.3-1
