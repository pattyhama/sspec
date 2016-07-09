#
# Cookbook Name:: package
# Recipe:: default
#
# Copyright 2016, Harumi Hamaoka
#
# All rights reserved - Do Not Redistribute
#

# call recipe of package cookbook
include_recipe 'package::basic'
include_recipe 'package::web'
