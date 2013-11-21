#
# Cookbook Name:: rubies
# Recipe:: default
#

include_recipe 'build-essential'
include_recipe 'chruby_install'
include_recipe 'ruby_install'

node[:rubies][:list].each do |ruby|
  ruby_install_ruby ruby

  if node[:rubies][:install_bundler]
    gem_package "bundler" do
      gem_binary("/opt/rubies/#{ruby.gsub(' ', '-')}/bin/gem")
    end
  end
end
