memcached_session_manager_context '/path/to/context.xml' do
  memcachedNodes 'http://host1.yourdomain.com:8091/pools'
  failoverNodes 'n1'
  requestUriIgnorePattern '.*\.(ico|png|gif|jpg|css|js)$'
end
