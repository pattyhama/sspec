# Dockerfile for sspec
# https://github.com/pattyhama

FROM ubuntu

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN curl -L http://www.opscode.com/chef/install.sh | bash
ENV CHEF_REPO /root/chef-repo
WORKDIR /root/dockerbuild
ADD cookbooks ${CHEF_REPO}/chef-repo/cookbooks
ADD solo.rb ${CHEF_REPO}/chef-repo/solo.rb
RUN cd ${CHEF_REPO} && chef-solo -c ${CHEF_REPO}/chef-repo/solo.rb -j ${CHEF_REPO}/chef-repo/localhost.json
