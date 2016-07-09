#
# Cookbook Name:: nginx
# Recipe:: nginx
#
# Copyright 2016, Harumi Hamaoka
#
# All rights reserved - Do Not Redistribute
#

template '/etc/init.d/nginx' do
  path '/etc/init.d/nginx'
  source 'nginx-daemon.erb'
  owner 'root'
  group 'root'
  mode 0755
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

template 'nginx.conf' do
  path '/etc/nginx/nginx.conf'
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[nginx]'
end
