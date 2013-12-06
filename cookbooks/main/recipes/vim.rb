package 'vim'

template '/etc/vim/vimrc.local' do
  source 'vimrc'
end

%w[
  autoload
  bundle
].each do |name|
  directory "/home/#{node[:user]}/.vim/#{name}" do
    user node[:user]
    group node[:user]
    recursive true
  end
end

remote_file "/home/#{node[:user]}/.vim/autoload/pathogen.vim" do
  source 'https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim'
  owner node[:user]
  group node[:user]
  action :create_if_missing
end

git "/home/#{node[:user]}/.vim/bundle/nerdtree" do
  repository 'https://github.com/scrooloose/nerdtree.git'
  user node[:user]
  group node[:user]
end
