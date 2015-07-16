def whyrun_supported?
  true
end

action :create do
  converge_by('memcached_session_manager_context create') do
    context_manager_path = "#{Chef::Config[:file_cache_path]}/context_manager.xml"

    template context_manager_path do
      source 'context_manager.xml.erb'
      cookbook 'memcached_session_manager'
      variables(resource: new_resource)
    end

    ruby_block 'add manager to context' do
      block do
        context = ::IO.read(new_resource.dest)
        manager = ::IO.read(context_manager_path)

        if (context =~ %r{<Manager.*/>}m).nil? # add manager
          context = context.gsub(%r{</Context>}, "\n#{manager}\n</Context>")
        else # overwrite manager
          context = context.gsub(%r{<Manager.*/>}m, manager)
        end

        ::File.open(new_resource.dest, 'w') { |file| file.puts context }
      end
    end
  end
end
