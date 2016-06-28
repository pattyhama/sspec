require 'spec_helper'

dns_server = '8.8.8.8'

# Check if file exists
['/etc/resolv.conf'].each do |file|
  describe file(file) do
    it { should be_file }
  end
end

# Check nameserver
describe command('cat /etc/resolv.conf') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /^nameserver #{dns_server}/ }
end

# Check if Internet site can be resolved
describe host('github.com') do
  it { should be_resolvable }
end

# Check ping reachability
describe host('8.8.8.8') do
  # ping
  it { should be_reachable }
end
