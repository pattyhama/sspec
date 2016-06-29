#
# Cookbook Name:: package
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'git' do
  action [:install]
end

package 'foodcritic' do
  action [:install]
end

package 'traceroute' do
  action [:install]
end
