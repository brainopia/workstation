execute 'add-apt-repository ppa:gnome-terminator'
package 'terminator'

directory "/home/#{node[:user]}/.config/terminator" do
  owner node[:user]
  group node[:user]
  recursive true
end

template "/home/#{node[:user]}/.config/terminator/config" do
  source 'terminator'
  owner node[:user]
  group node[:user]
end

template "/home/#{node[:user]}/.alias" do
  source 'alias'
  owner node[:user]
  group node[:user]
end

template "/home/#{node[:user]}/.bash_profile" do
  source 'bash_profile'
  owner node[:user]
  group node[:user]
end
