rails_apps = "/home/#{node[:user]}/code/rails"
oms_path = "/home/#{node[:user]}/code/rails/oms-oxyetb" 

directory rails_apps do
  user node[:user]
end

git oms_path do
  repository "git@github.com:evilmartians/ohmystats-oxyetb.git"
  user node[:user]
end

execute 'docker pull johncosta/redis'
execute 'docker pull jrwyatt/cassandra2'

bash 'bundle' do
  code 'bundle --path=.bundle'
  cwd oms_path
  flags	'--login'
  user node[:user]
end
