require 'spec_helper'

# Check installed packages
%w(chef traceroute nginx).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('rubocop') do
  it { should be_installed.by('gem').with_version('0.41.1') }
end

describe package('foodcritic') do
  it { should be_installed.by('gem').with_version('6.3.0') }
end
