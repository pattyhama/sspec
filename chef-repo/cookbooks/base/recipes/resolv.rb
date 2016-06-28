#
# Cookbook Name:: base
# Recipe:: resolv
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# cookbook_file "/etc/resolv.conf"

template '/etc/resolv.conf' do
  source 'resolv.conf.erb'
  manage_symlink_source true
  action :create
  owner 'root'
  group 'root'
  mode 0644
end
