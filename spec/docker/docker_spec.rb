require 'spec_helper'

describe process("docker") do
  it { should be_running }
end
