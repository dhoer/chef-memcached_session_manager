context_manager_remove = "#{Chef::Config[:file_cache_path]}/context_manager_remove.xml"

cookbook_file context_manager_remove do
  source 'context_manager_exists.xml'
  action :create
end

memcached_session_manager_context context_manager_remove do
  action :remove
end
