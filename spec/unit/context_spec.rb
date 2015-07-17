require 'spec_helper'

describe 'memcached_session_manager_test::context_install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      file_cache_path: '/var/chef/cache',
      platform: 'centos',
      version: '7.0',
      step_into: 'memcached_session_manager_context'
    ).converge(described_recipe)
  end

  it 'copies context manager none' do
    expect(chef_run).to create_cookbook_file('/var/chef/cache/context_manager_install.xml').with(
        source: 'context_manager_none.xml'
      )
  end

  it 'install manager context' do
    expect(chef_run).to install_memcached_session_manager_context('/var/chef/cache/context_manager_install.xml').with(
        memcachedNodes: 'http://host1.yourdomain.com:8091/pools',
        failoverNodes: 'n1',
        requestUriIgnorePattern: '.*\.(ico|png|gif|jpg|css|js)$'
      )
  end

  it 'creates context manager template' do
    expect(chef_run).to create_template('/var/chef/cache/context_manager.xml').with(
        source: 'context_manager.xml.erb',
        cookbook: 'memcached_session_manager'
      )
  end

  it 'install manager element to context xml' do
    expect(chef_run).to run_ruby_block('install manager')
  end
end

describe 'memcached_session_manager_test::context_update' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      file_cache_path: '/var/chef/cache',
      platform: 'centos',
      version: '7.0',
      step_into: 'memcached_session_manager_context'
    ).converge(described_recipe)
  end

  it 'copies context manager exists' do
    expect(chef_run).to create_cookbook_file('/var/chef/cache/context_manager_update.xml').with(
        source: 'context_manager_exists.xml'
      )
  end

  it 'install manager context' do
    expect(chef_run).to install_memcached_session_manager_context('/var/chef/cache/context_manager_update.xml').with(
        memcachedNodes: 'http://host1.yourdomain.com:8091/pools',
    failoverNodes: 'n1',
    requestUriIgnorePattern: '.*\.(ico|png|gif|jpg|css|js)$'
      )
  end

  it 'creates context manager template' do
    expect(chef_run).to create_template('/var/chef/cache/context_manager.xml').with(
        source: 'context_manager.xml.erb',
        cookbook: 'memcached_session_manager'
      )
  end

  it 'install manager element to context xml' do
    expect(chef_run).to run_ruby_block('install manager')
  end
end

describe 'memcached_session_manager_test::context_remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      file_cache_path: '/var/chef/cache',
      platform: 'centos',
      version: '7.0',
      step_into: 'memcached_session_manager_context'
    ).converge(described_recipe)
  end

  it 'copies context manager exists' do
    expect(chef_run).to create_cookbook_file('/var/chef/cache/context_manager_remove.xml').with(
        source: 'context_manager_exists.xml'
      )
  end

  it 'removes manager context' do
    expect(chef_run).to remove_memcached_session_manager_context('/var/chef/cache/context_manager_remove.xml')
  end

  it 'removes manager element from context xml' do
    expect(chef_run).to run_ruby_block('remove manager')
  end
end
