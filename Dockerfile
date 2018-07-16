# Dockerfile for sspec
# https://github.com/pattyhama

FROM ubuntu

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

# Install Chef
RUN apt-get install -y curl

# Install gem_package resources for Chef
RUN apt-get install -y make gcc ruby

# Set up Chef
ENV CHEF_REPO /root/chef-repo
WORKDIR /root/dockerbuild
RUN curl -L http://www.opscode.com/chef/install.sh | bash
ADD cookbooks ${CHEF_REPO}/cookbooks
ADD solo.rb ${CHEF_REPO}/solo.rb
ADD localhost.json ${CHEF_REPO}/localhost.json

# Run Chef
RUN /usr/bin/chef-solo -c ${CHEF_REPO}/solo.rb -j ${CHEF_REPO}/localhost.json
