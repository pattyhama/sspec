require 'spec_helper'

# Check installed packages
%w(chef traceroute nginx).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('pry') do
#  let(:path) { '/opt/chef/embedded/lib/ruby/gems' }
  it { should be_installed.by('gem') }
end
