require 'spec_helper'

# Check installed packages
%w(chef traceroute git foodcritic nginx).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
