require 'spec_helper'

# Check installed packages
%w(chef nginx git foodcritic).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Check installed package version
# describe command('chef-solo -v') do
#  its(:stdout) { should match /11.8.2/ }
#end

%w(chef).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe command('chef-solo -v') do
  its(:stdout) { should match /12.11.18/ }
end

describe command('nginx -v') do
  its(:stderr) { should match /1.4.6/ }
end

describe command('git --version') do
  its(:stdout) { should match /1.9.1/ }
end

describe command('foodcritic -V') do
  its(:stdout) { should match /3.0.3/ }
end

describe command('traceroute -V') do
  its(:stderr) { should match /2.0.20/ }
end

describe package('rubocop') do
  it { should be_installed.by('gem').with_version('0.40.0') }
end
