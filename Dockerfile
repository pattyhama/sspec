# Dockerfile for sspec
# https://github.com/pattyhama

FROM ubuntu

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y
