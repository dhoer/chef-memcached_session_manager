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

  it 'creates context manager template' do
    expect(chef_run).to create_template('/var/chef/cache/context_manager.xml').with(
      source: 'context_manager.xml.erb',
      cookbook: 'memcached_session_manager'
    )
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

  it 'creates context manager template' do
    expect(chef_run).to create_template('/var/chef/cache/context_manager.xml').with(
        source: 'context_manager.xml.erb',
        cookbook: 'memcached_session_manager'
      )
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

  it 'removes manager element from context xml' do
    expect(chef_run).to installs_memcached_session_manager_context('/var/chef/cache/context_manager_remove.xml')
  end

  it 'creates context manager template' do
    expect(chef_run).to create_template('/var/chef/cache/context_manager.xml').with(
        source: 'context_manager.xml.erb',
        cookbook: 'memcached_session_manager'
      )
  end
end
