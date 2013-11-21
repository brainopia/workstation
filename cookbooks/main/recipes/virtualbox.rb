remote_file '/etc/yum.repos.d/virtualbox.repo' do
  source 'http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo'
  action :create_if_missing
end

yum_package 'VirtualBox-4.2'
