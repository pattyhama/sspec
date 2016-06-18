require 'spec_helper'

%w{nginx git}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
