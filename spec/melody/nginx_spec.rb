require 'spec_helper'

# Check if file exists
# ['/etc/nginx/nginx.conf'].each do |file|
#  describe file(file) do
#    it { should be_file }
#  end
#end

# Check if nginx is running/enabled
describe service('nginx') do
  it { should be_running }
  it { should be_enabled }
end

# Check if port 80 is listening
describe port(80) do
  it { should be_listening }
end

# Check if HTTP status code 200 is returned
describe command('curl http://127.0.0.1 -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end
