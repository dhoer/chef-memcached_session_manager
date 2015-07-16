context_manager_install = "#{Chef::Config[:file_cache_path]}/context_manager_install.xml"

cookbook_file context_manager_install do
  source 'context_manager_none.xml'
  action :create
end

memcached_session_manager_context context_manager_install do
  memcachedNodes 'http://host1.yourdomain.com:8091/pools'
  failoverNodes 'n1'
  requestUriIgnorePattern '.*\.(ico|png|gif|jpg|css|js)$'
end
