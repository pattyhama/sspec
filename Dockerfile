# Dockerfile for sspec
# https://github.com/pattyhama

FROM ubuntu

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y curl

ENV CHEF_REPO /root/chef-repo

WORKDIR /root/dockerbuild

RUN curl -L http://www.opscode.com/chef/install.sh | bash

ADD cookbooks ${CHEF_REPO}/cookbooks
ADD solo.rb ${CHEF_REPO}/solo.rb
ADD localhost.json ${CHEF_REPO}/localhost.json

RUN /usr/bin/chef-solo -c ${CHEF_REPO}/solo.rb -j ${CHEF_REPO}/localhost.json
