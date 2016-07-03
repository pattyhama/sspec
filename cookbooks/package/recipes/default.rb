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

%W{ ruby nginx }.each do |pkg|
  package "#{pkg}" do
    action [ :install ]
  end
end

gem_package 'pry' do
  action [ :install ]
  options "--no-rdoc --no-ri"
end

execute 'test' do
   command 'pwd && which ruby && which gem'
end

# gem_package 'foodcritic' do
#  action [ :install ]
#  options "--no-rdoc --no-ri"
# end
