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
  version '1:1.9.1-1ubuntu0.3'
end

package 'foodcritic' do
  action [:install]
  version '3.0.3-1'
end

package 'traceroute' do
  action [:install]
end

%w(rubocop).each do |pkg|
  gem_package pkg do
    gem_binary '/usr/bin/gem'
    version '0.40.0'
    action :install
  end
end
