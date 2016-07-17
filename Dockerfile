# Dockerfile for sspec
# https://github.com/pattyhama

FROM ubuntu

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
# RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

RUN apt-get update
RUN apt-get upgrade -y

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

# for Apache
EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# for debug <from here>
# for installing Apache
# RUN apt-get install -y links
# for installing for debug e.g. netstat
# RUN apt-get install -y net-tools
# RUN cat /etc/passwd
# RUN cat /etc/group
# RUN apachectl configtest
# RUN apachectl status
# RUN ps aux | grep apache
# RUN curl http://localhost:80 || apachectl start ; echo $?
# RUN netstat -n
# RUN ps aux | grep apache
# for debug <to here>
