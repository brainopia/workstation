#
# Cookbook Name:: chruby_install
# Attributes:: default
#

default[:chruby_install][:git_url] = 'https://github.com/postmodern/chruby.git'
default[:chruby_install][:git_ref] = 'v0.3.7'

default[:chruby_install][:auto_upgrade] = false

default[:chruby_install][:auto] = true
default[:chruby_install][:default_ruby] = false

default[:chruby_install][:use_embedded] = false
default[:chruby_install][:use_rvm] = false
default[:chruby_install][:use_rbenv] = false
default[:chruby_install][:use_rbfu] = false

case platform
  when "redhat", "centos", "fedora", "amazon", "scientific"
    default[:chruby_install][:git_packages] = %w{ git }

  when "debian", "ubuntu", "suse", "mac_os_x"
    default[:chruby_install][:git_packages] = %w{ git-core }
end
