#
# Cookbook Name:: apache
# Recipe:: apache
#
# Copyright 2014, Harumi Hamaoka
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
  action :install
end

service "httpd" do
  action [ :enable, :start ]
end
