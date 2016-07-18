require 'spec_helper'

# Check if a named container is running
describe docker_container('melody') do
  it { should be_running }
end

# Check if a specific image been pulled to the host
describe docker_image('ubuntu:latest') do
  it { should exist }
end
