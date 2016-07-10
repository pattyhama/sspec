require 'spec_helper'

# Check installed packages
%w( apache2 ).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
