# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Available Rake tasks:
#
# $ rake -T
# rake integration:docker[regexp,action]   # Run tests with kitchen-docker
# rake integration:vagrant[regexp,action]  # Run tests with kitchen-vagrant
#
# More info at https://github.com/ruby/rake/blob/master/doc/rakefile.rdoc
#

require 'bundler/setup'

desc 'Clean some generated files'
task :clean do
  %w(
    Berksfile.lock
    .bundle
    .cache
    coverage
    Gemfile.lock
    .kitchen
    metadata.json
    vendor
  ).each { |f| FileUtils.rm_rf(Dir.glob(f)) }
end

namespace :style do
  require 'cookstyle'
  require 'rubocop/rake_task'
  desc 'Run Ruby style checks using cookstyle rubocop'
  RuboCop::RakeTask.new(:ruby) do |task|
    task.options << '--display-cop-names'
  end

  require 'foodcritic'
  desc 'Run Chef style checks using foodcritic'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ['any'],
      progress: true
    }
  end
end

desc 'Run all style checks'
# task style: %w(style:chef style:ruby)
task 'style' do
  %w(style:chef style:ruby).each do |task_name|
    sh "rake #{task_name}" do
    end
  end
end

desc 'Run Test Kitchen integration tests'
namespace :integration do
  # Gets a collection of instances.
  #
  # @param regexp [String] regular expression to match against instance names.
  # @param config [Hash] configuration values for the `Kitchen::Config` class.
  # @return [Collection<Instance>] all instances.
  def kitchen_instances(regexp, config)
    instances = Kitchen::Config.new(config).instances
    return instances if regexp.nil? || regexp == 'all'
    instances.get_all(Regexp.new(regexp))
  end

  # Runs a test kitchen action against some instances.
  #
  # @param action [String] kitchen action to run (defaults to `'test'`).
  # @param regexp [String] regular expression to match against instance names.
  # @param loader_config [Hash] loader configuration options.
  # @return void
  def run_kitchen(action, regexp, loader_config = {})
    action = 'test' if action.nil?
    require 'kitchen'
    Kitchen.logger = Kitchen.default_file_logger
    config = { loader: Kitchen::Loader::YAML.new(loader_config) }
    kitchen_instances(regexp, config).each { |i| i.send(action) }
  end

  desc 'Run integration tests with kitchen-vagrant'
  task :vagrant, [:regexp, :action] do |_t, args|
    run_kitchen(args.action, args.regexp)
  end

  desc 'Run integration tests with kitchen-docker'
  task :docker, [:regexp, :action] do |_t, args|
    run_kitchen(args.action, args.regexp, local_config: '.kitchen.docker.yml')
  end
end

task default: %w(integration:docker)
