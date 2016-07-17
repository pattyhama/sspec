# Dockerfile for sspec
# https://github.com/pattyhama

FROM ubuntu

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
# RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

RUN apt-get update
RUN apt-get upgrade -y

# for Apache
EXPOSE 80

# for installing Apache
RUN apt-get install links

# for installing Chef
RUN apt-get install -y curl

# for gem_package resource of Chef
RUN apt-get install -y make gcc ruby

# Setting up Chef
ENV CHEF_REPO /root/chef-repo
WORKDIR /root/dockerbuild
RUN curl -L http://www.opscode.com/chef/install.sh | bash
ADD cookbooks ${CHEF_REPO}/cookbooks
ADD solo.rb ${CHEF_REPO}/solo.rb
ADD localhost.json ${CHEF_REPO}/localhost.json

# Run Chef
RUN /usr/bin/chef-solo -c ${CHEF_REPO}/solo.rb -j ${CHEF_REPO}/localhost.json

# for debug
RUN apachectl configtest
RUN apachectl status

# for Apache
# RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# RUN mkdir /etc/nginx/ssl
# ADD default /etc/nginx/sites-available/default
