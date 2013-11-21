file "/home/#{node[:user]}/.gemrc" do
  content 'gem: --no-rdoc --no-ri'
  owner node[:user]
  group node[:user]
end
