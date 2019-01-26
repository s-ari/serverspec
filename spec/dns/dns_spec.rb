require 'spec_helper'

describe host('www.google.co.jp') do
  it { should be_reachable }
end

describe host('8.8.8.8') do
  it { should be_reachable }
end
