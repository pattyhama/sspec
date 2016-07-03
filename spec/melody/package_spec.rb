require 'spec_helper'

# Check installed packages
%w(chef traceroute).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
