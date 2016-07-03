require 'spec_helper'

# Check installed packages
%w(chef traceroute foodcritic rubocop nginx).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
