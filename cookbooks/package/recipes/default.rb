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

%W{ nginx }.each do |pkg|
  package "#{pkg}" do
    action [ :install ]
  end
end

gem_package 'pry' do
  action [ :install ]
  options "--no-rdoc --no-ri"
  gem_binary '/usr/bin/gem'
end

# gem_package 'foodcritic' do
#  action [ :install ]
#  options "--no-rdoc --no-ri"
# end
