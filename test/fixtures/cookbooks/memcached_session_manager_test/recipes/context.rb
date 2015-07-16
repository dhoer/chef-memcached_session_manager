cookbook_file "#{Chef::Config[:file_cache_path]}/context_add.xml" do
  source 'context_add.xml'
  action :create
end

memcached_session_manager_context "#{Chef::Config[:file_cache_path]}/context_add.xml" do
  memcachedNodes 'http://host1.yourdomain.com:8091/pools'
  failoverNodes 'n1'
  requestUriIgnorePattern '.*\.(ico|png|gif|jpg|css|js)$'
end
