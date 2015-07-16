def whyrun_supported?
  true
end

action :create do
  converge_by('memcached_session_manager_context') do
    template "#{Chef::Config[:file_cache_path]}/context_manager.xml" do
      source 'context_manager.xml.erb'
      cookbook 'memcached_session_manager'
      variables(resource: new_resource)
    end
  end
end
