#
# Cookbook Name:: chruby_install
# Recipe:: default
#

Array(node[:chruby_install][:git_packages]).each do |pkg|
  package pkg do
    not_if "git --version >/dev/null"
  end
end
