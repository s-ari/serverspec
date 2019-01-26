require 'spec_helper'

puts "##### TEST ####"
p host_inventory['hostname'] 
p property[:server_id]
p property[:ip_address]
p property[:test_vars]
