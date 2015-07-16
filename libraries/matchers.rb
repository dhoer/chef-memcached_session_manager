if defined?(ChefSpec)
  def create_memcached_session_manager_context(name)
    ChefSpec::Matchers::ResourceMatcher.new(:memcached_session_manager, :create_memcached_session_manager_context, name)
  end
end
