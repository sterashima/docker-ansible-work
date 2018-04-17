require 'spec_helper'

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe command("firewall-cmd --list-all") do
  its(:stdout) { should contain('services:.*ssh') }
  its(:stdout) { should contain('services:.*http') }
  its(:stdout) { should contain('services:.*https') }
  its(:stdout) { should contain('ports: ') }
end

describe package('php') do
  it { should be_installed.with_version '5.6' }
end
