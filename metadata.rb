name 'git_ppa'
maintainer 'Jason Blalock'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs git from git-core PPA'
long_description 'Installs git from git-core PPA'
version '0.2.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

supports 'ubuntu'

source_url 'https://github.com/jasonblalock-cookbooks/git_ppa'
issues_url 'https://github.com/jasonblalock-cookbooks/git_ppa/issues'
