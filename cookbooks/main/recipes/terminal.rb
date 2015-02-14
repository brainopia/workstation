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

%w[autoload bin].each do |name|
  directory "/home/#{node[:user]}/code/#{name}" do
    owner node[:user]
    group node[:user]
  end
end

template "/home/#{node[:user]}/code/autoload/aliases.sh" do
  source 'aliases'
  owner node[:user]
  group node[:user]
end

remote_file "/home/#{node[:user]}/code/autoload/z.sh" do
  source 'https://raw.github.com/rupa/z/master/z.sh'
  owner node[:user]
  group node[:user]
end

remote_file "/usr/local/man/man1/z.1" do
  source 'https://raw.github.com/rupa/z/master/z.1'
  owner node[:user]
  group node[:user]
end

remote_file "/home/#{node[:user]}/code/bin/v" do
  source 'https://raw.github.com/rupa/v/master/v'
  owner node[:user]
  group node[:user]
  mode '755'
end

remote_file "/usr/local/man/man1/v.1" do
  source 'https://raw.github.com/rupa/v/master/v.1'
  owner node[:user]
  group node[:user]
end

template "/home/#{node[:user]}/.bash_profile" do
  source 'bash_profile'
  owner node[:user]
  group node[:user]
end

__END__

file "/home/#{node[:user]}/.ssh/config" do
  content <<-FILE.gsub(/^ {4}/, '')
    ServerAliveInterval 15
    ServerAliveCountMax 3
  FILE
  owner node[:user]
  group node[:user]
end
