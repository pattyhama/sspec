#
# Cookbook Name:: apache
# Recipe:: apache
#
# Copyright 2014, Harumi Hamaoka
#
# All rights reserved - Do Not Redistribute
#

# Ref: https://github.com/bkonkle/chef-cookbooks/blob/master/apache2/recipes/default.rb

package 'apache2' do
  action :install
end

template '/var/www/index.html' do
  source 'index.html.erb'
  mode '0644'
end

service 'apache2' do
  action [:enable, :start]
end

template "apache2.conf" do
  source 'apache2.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, resources(:service => "apache2")
end

template "#{node[:apache][:dir]}/ports.conf" do
  source "ports.conf.erb"
  group "root"
  owner "root"
  variables :apache_listen_ports => node[:apache][:listen_ports]
  mode 0644
  notifies :restart, resources(:service => "apache2")
end
