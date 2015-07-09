# Memcached Session Manager Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/memcached_session_manager.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-memcached_session_manager.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-memcached_session_manager.svg?style=flat-square)][github]

[cookbook]: https://supermarket.chef.io/cookbooks/memcached_session_manager
[travis]: https://travis-ci.org/dhoer/chef-memcached_session_manager
[github]: https://github.com/dhoer/chef-memcached_session_manager/issues

This cookbook installs Tomcat high-availability clusters with memcached 
(https://code.google.com/p/memcached-session-manager/).

## Requirements

- Java must be installed outside of this cookbook.
- Tomcat must be installed outside of this cookbook.  This cookbook expects `$CATALINA_HOME` to be defined in
environment. If it is not, then `node['memcached_session_manager']['tomcat']['lib']` must be overridden.
- Chef 11.14 or higher.

### Platforms

- CentOS
- RedHat
- Ubuntu


## Usage

Include the default recipe on a node's runlist to ensure that memcached_session_manager is installed on tomcat.

### Attributes
- `node['memcached_session_manager']['version']` - Version of memcached_session_manager. 
- `node['memcached_session_manager']['flavor']` - Flavors `memcached` and `couchbase` are supported. Defaults to `memcached`.
- `node['memcached_session_manager']['tomcat']['base_version']` - Defaults to `7`.
- `node['memcached_session_manager']['tomcat']['lib']` -  Defaults to `$CATALINA_HOME/lib/`. 
Be sure to override this if $CATALINA_HOME is not defined in your environment.
- `node['memcached_session_manager']['spymemcached']['version']` -  
Version of `spymemcached` to download to support `memcached` flavor.

## custom_serializer 

Adds custom serializers to your webapp. If you want to use a custom serialization strategy (e.g. because of better 
performance) this has to be deployed with your webapp so that they're available in `WEB-INF/lib/`.

### Resource Attributes

- `dest` - The path to 
- `cookbook` - Optional. Cookbook where the source template is. If this is not defined, Chef will use the named 
template in the cookbook where the definition is used.
- `template` - Default `master_preferences.json.erb`, source template file.
- `params` - Additional parameters, see Examples.

### Examples
    
The following example would look for a template named `master_preferences.json.erb` in your cookbook:

```ruby
memcached_session_manager_custom_serializer 'custom_preferences' do
  params(
    homepage: 'https://mycompany.com/'
    import_bookmarks_from_file: 'c:\path\to\bookmarks.html'
  )
  action :master_preferences
end
```

The memcached_session_manager cookbook comes with a `master_preferences.json.erb` template as an example. The following parameter is used 
in the template:

- `homepage` - Sets the homepage URL.

To use the default template preferences, set cookbook to `memcached_session_manager`, for example:

```ruby
memcached_session_manager 'set_user_preferences' do
  cookbook 'memcached_session_manager'
  params(
    homepage: 'https://www.getchef.com'
  )
  action :master_preferences
end
```
    
The parameter specified will be used as:

- `@params[:homepage]`

In the template, when you write your own, the `@` is significant.

## ChefSpec Matchers

This cookbook includes custom [ChefSpec](https://github.com/sethvargo/chefspec) matchers you can use to test your 
own cookbooks.

Example Matcher Usage

```ruby
expect(chef_run).to master_preferences_memcached_session_manager('name').with(
  params: {
    homepage: 'https://www.getchef.com'
  }
)
```
      
Cookbook Matchers

- master_preferences_memcached_session_manager(name)

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-memcached_session_manager/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-memcached_session_manager/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-memcached_session_manager/blob/master/LICENSE.md) file for details.
