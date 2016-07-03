#
# Cookbook Name:: package
# Recipe:: default
#
# Copyright 2016, Harumi Hamaoka
#
# All rights reserved - Do Not Redistribute
#

package 'traceroute' do
  action :install
end

%W{ nginx }.each do |pkg|
  package pkg do
    action :install
  end
end

gem_package 'pry' do
  action :install
  options "--no-rdoc --no-ri"
end
