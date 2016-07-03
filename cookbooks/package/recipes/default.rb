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

%W{ foodcritic nginx }.each do |pkg|
  package "#{pkg}" do
    action [ :install ]
  end
end
