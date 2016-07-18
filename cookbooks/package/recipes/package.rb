#
# Cookbook Name:: package
# Recipe:: package
#
# Copyright 2016, Harumi Hamaoka
#
# All rights reserved - Do Not Redistribute
#

%w(vim traceroute net-tools).each do |pkg|
  package pkg do
    action :install
  end
end

gem_package 'pry' do
  action :install
  options '--no-rdoc --no-ri'
end
