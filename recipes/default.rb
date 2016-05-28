#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright (c) 2016 Jason Blalock, All Rights Reserved.

include_recipe 'apt::default'

apt_repository "git-core" do
  uri node['git']['repository']['uri']
  components ['main']
  arch node['git']['platform']['architecture']
  distribution node['git']['platform']['distro']
  key node['git']['repository']['key']
  keyserver node['git']['repository']['keyserver']
  action :add
  deb_src true
end

package 'git' do
  action :upgrade
end
