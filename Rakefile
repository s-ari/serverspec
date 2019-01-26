require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

properties = YAML.load_file(ENV['list'])

desc "Run serverspec to all hosts"
task :spec => 'serverspec:all'

namespace :serverspec do
  task :all => properties.keys.map {|key| 'serverspec:' + key.split('.')[0] }
  properties.keys.each do |key|
    desc "Run serverspec to #{key}"
    RSpec::Core::RakeTask.new(key.split('.')[0].to_sym) do |t|
      ENV['TARGET_HOST'] = key
      ENV['TARGET_IP'] = properties[key][:ip_address]
      t.pattern = 'spec/{' + properties[key][:roles].join(',') + '}/*_spec.rb'
      t.fail_on_error = false
    end
  end
end
