#
# Cookbook Name:: package
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'traceroute' do
  action [:install]
end

package 'nginx' do
  action :install
end
