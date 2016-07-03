require 'spec_helper'

# Check installed packages
%w(chef traceroute nginx foodcritic).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# describe package('rubocop') do
#  it { should be_installed.by('gem') }
# end

# describe package('foodcritic') do
#  it { should be_installed.by('gem') }
# end
