require 'spec_helper'

describe 'memcached_session_manager::context' do
  describe file('/tmp/kitchen/cache/context_manager_install.xml') do
    its(:content) { should match %r{memcachedNodes="http://host1.yourdomain.com:8091/pools"} }
  end

  describe file('/tmp/kitchen/cache/context_manager_update.xml') do
    its(:content) { should match %r{memcachedNodes="http://host1.yourdomain.com:8091/pools"} }
  end

  describe file('/tmp/kitchen/cache/context_manager_remove.xml') do
    its(:content) { should_not match %r{<Manager.*/>}m }
  end
end
