#
# Cookbook Name:: sublime_text
# Attributes:: default
#
# Copyright (C) 2016 Jason Blalock
#
# MIT License
#

distro_name = case node['platform_version']
when '14.04'
  'trusty'
when '16.04'
  'xenial'
end

default['git']['platform']['distro'] = distro_name
default['git']['platform']['architecture'] = 'amd64'
default['git']['repository']['uri'] = 'http://ppa.launchpad.net/git-core/ppa/ubuntu'
default['git']['repository']['keyserver'] = 'keyserver.ubuntu.com'
default['git']['repository']['key'] = 'E1DF1F24'
