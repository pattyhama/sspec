require 'spec_helper'

# Check if nginx is installed
describe package('nginx') do
  it { should be_installed }
end

# Check if file exists
['/etc/nginx/nginx.conf'].each do |file|
  describe file(file) do
    it { should be_file }
  end
end

# Check if nginx is running/enabled
describe service('nginx') do
  it { should be_running }
  it { should be_enabled }
end

# Check if port 80 is listening
describe port(80) do
  it { should be_listening }
end
