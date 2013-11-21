raise 'missing ENV[DATA_SECRET]' unless ENV['DATA_SECRET']

def decrypt(data_bag, item)
  Chef::EncryptedDataBagItem.load data_bag, item, ENV['DATA_SECRET']
end

public_key  = data_bag_item('ssh', 'public_key')['value']
private_key = decrypt('ssh', 'private_key')['value']

file "/home/#{node[:user]}/.ssh/id_dsa" do
  content private_key
  owner node[:user]
  group node[:user]
  mode '600'
  action :create_if_missing
end

file "home/#{node[:user]}/.ssh/id_dsa.pub" do
  content public_key
  owner node[:user]
  group node[:user]
  mode '644'
  action :create_if_missing
end
