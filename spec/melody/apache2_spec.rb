require 'spec_helper'

# Check installed packages
%w(apache2).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Check if apache2 is running/enabled
describe service('apache2') do
  it { should be_running }
  it { should be_enabled }
end

# Check if port 80 is listening
describe port(8080) do
  it { should be_listening }
end

# Check if file exists
# ['/var/www/index.html'].each do |file|
#   describe file(file) do
#     it { should be_file }
#     it { should be_mode 644 }
#     it { should contain 'hello apache' }
#   end
# end

# Check if HTTP status code 200 is returned
# describe command('curl http://127.0.0.1 -o /dev/null -w "%{http_code}\n" -s') do
#  its(:stdout) { should match /^200$/ }
# end
