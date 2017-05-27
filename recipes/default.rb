#
# Cookbook:: git_ppa
# Recipe:: default
#
# Copyright:: 2017, Jason Blalock, All Rights Reserved.

apt_repository 'git-core' do
  uri 'http://ppa.launchpad.net/git-core/ppa/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  key 'E1DF1F24'
  keyserver 'keyserver.ubuntu.com'
end

package 'git' do
  action :upgrade
end
