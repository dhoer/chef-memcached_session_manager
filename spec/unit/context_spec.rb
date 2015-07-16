require 'spec_helper'

describe 'memcached_session_manager_test::context' do
  let(:chef_run) {
    ChefSpec::SoloRunner.new(
      file_cache_path: '/var/chef/cache',
      platform: 'centos',
      version: '7.0',
      step_into: 'memcached_session_manager_context'
    ).converge(described_recipe)
  }

  it 'creates context manager template' do
    expect(chef_run).to create_template('/var/chef/cache/context_manager.xml').with(
      source: 'context_manager.xml.erb',
      cookbook: 'memcached_session_manager'
    )
  end
end
