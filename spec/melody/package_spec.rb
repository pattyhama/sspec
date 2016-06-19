require 'spec_helper'

# Check installed packages
%w{chef nginx git foodcritic}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Check installed package version
describe command('chef-solo -v') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /11.8.2/ }
end

describe command('nginx -v') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should match /1.4.6/ }
end

describe command('git --version') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /1.9.1/ }
end

describe command('foodcritic -V') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /3.0.3/ }
end
