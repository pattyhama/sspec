require 'spec_helper'

# Check what packages are installed
%w{nginx git}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Check installed package version
describe command('nginx -v') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should match /1.4.6/ }
end
