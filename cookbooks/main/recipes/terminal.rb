execute 'add-apt-repository ppa:gnome-terminator'
package 'terminator'

directory "/home/#{node[:user]}/.config/terminator" do
  user node[:user]
  group node[:user]
  recursive true
end

template "/home/#{node[:user]}/.config/terminator/config" do
  source 'terminator'
  user node[:user]
  group node[:user]
end
