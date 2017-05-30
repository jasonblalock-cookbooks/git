# frozen_string_literal: true
# -*- mode: ruby -*-
# vi: set ft=ruby :

# More info at http://bundler.io/gemfile.html
#
# Many of the gem versions installed here are based on the versions installed
# by ChefDK.

source 'https://rubygems.org'

gem 'rake', '~> 12.0'
gem 'chef-dk'

group :integration do
  gem 'test-kitchen', '~> 1.16'
  gem 'kitchen-inspec', '~> 0.19'
end

group :integration_docker do
  gem 'kitchen-docker', '~> 2.6'
end

group :integration_vagrant do
  gem 'kitchen-vagrant', '~> 1.1'
  gem 'vagrant-wrapper', '~> 2.0'
end
