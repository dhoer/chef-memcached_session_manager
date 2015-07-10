require 'spec_helper'

describe 'memcached_session_manager::default' do
  describe file('/usr/share/tomcat7/lib/memcached-session-manager-1.8.3.jar') do
    it { should be_file }
  end

  describe file('/usr/share/tomcat7/lib/memcached-session-manager-tc7-1.8.3.jar') do
    it { should be_file }
  end

  describe file('/usr/share/tomcat7/lib/spymemcached-2.11.1.jar') do
    it { should be_file }
  end
end
