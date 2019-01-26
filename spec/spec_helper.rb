require 'serverspec'
require 'net/ssh'
require 'yaml'

properties = YAML.load_file(ENV['list'])
host = ENV['TARGET_IP']
vars = ENV['TARGET_HOST']

set_property properties[vars]

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

options = Net::SSH::Config.for(host)
options[:user] ||= Etc.getlogin
options[:paranoid] = false
options[:user_known_hosts_file] = "/dev/null"
options[:user] = ENV['user'] ||= Etc.getlogin
options[:keys] = ENV['key_file']

set :host,        options[:host_name] || host
set :ssh_options, options
set :request_pty, true


# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'
