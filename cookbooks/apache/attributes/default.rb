# Original copyright 2008-2009, Opscode, Inc.
# This file has been modified from the original Opscode version.
# Ref: https://github.com/bkonkle/chef-cookbooks/blob/master/apache2/recipes/default.rb

# Where the various parts of apache are
override[:apache][:dir]     = "/etc/apache2"
override[:apache][:log_dir] = "/var/log/apache2"
override[:apache][:user]    = "www-data"
override[:apache][:binary]  = "/usr/sbin/apache2"
override[:apache][:icondir] = "/usr/share/apache2/icons"
override[:apache][:cache_dir] = "/var/cache/apache2"

# General settings
default[:apache][:listen_ports] = [ "80","443" ]
default[:apache][:contact] = "ops@example.com"
default[:apache][:timeout] = 300
default[:apache][:keepalive] = "On"
default[:apache][:keepaliverequests] = 100
default[:apache][:keepalivetimeout] = 5

# Security
default[:apache][:servertokens] = "Prod"
default[:apache][:serversignature] = "On"
default[:apache][:traceenable] = "On"

# mod_auth_openids
default[:apache][:allowed_openids] = Array.new

# Prefork Attributes
default[:apache][:prefork][:startservers] = 16
default[:apache][:prefork][:minspareservers] = 16
default[:apache][:prefork][:maxspareservers] = 32
default[:apache][:prefork][:serverlimit] = 400
default[:apache][:prefork][:maxclients] = 400
default[:apache][:prefork][:maxrequestsperchild] = 10000

# Worker Attributes
default[:apache][:worker][:startservers] = 4
default[:apache][:worker][:maxclients] = 1024
default[:apache][:worker][:minsparethreads] = 64
default[:apache][:worker][:maxsparethreads] = 192
default[:apache][:worker][:threadsperchild] = 64
default[:apache][:worker][:maxrequestsperchild] = 0
