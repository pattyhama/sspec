file_cache_path "/tmp/chef-solo"
cookbook_path ["/root/chef-repo/cookbooks"]
# log_level :debug

# avoid problems with locales on chef
# workaround https://github.com/opscode/chef/issues/2695
ENV['LANG'] = 'en_US.UTF-8'
ENV['LANGUAGE'] = ENV['LANG']
ENV['LC_ALL'] = ENV['LANG']
