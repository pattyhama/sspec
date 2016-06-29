require 'spec_helper'

# Check installed packages
%w(chef git foodcritic trceroute).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
