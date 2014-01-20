package 'vim-gnome'

template '/etc/vim/vimrc.local' do
  source 'vimrc'
end

%w[
  ~/.vim/autoload
  ~/.vim/bundle
  ~/.fonts
  ~/.config/fontconfig/conf.d
].each do |path|
  path.sub! '~', "/home/#{node[:user]}"
  directory path do
    user node[:user]
    group node[:user]
    recursive true
  end
end

{
  '~/.vim/autoload' =>
  'https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim',

  '~/.fonts' =>
  'https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf',

  '~/.config/fontconfig/conf.d' =>
  'https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf'
}.each do |path, from|
  path = path.sub '~', "/home/#{node[:user]}"
  path += '/' + from.split('/').last
  remote_file path do
    source from
    owner node[:user]
    group node[:user]
  end
end

%w[
  scrooloose/nerdtree
  kien/ctrlp.vim
  slim-template/vim-slim
  bling/vim-airline
  altercation/vim-colors-solarized
].each do |repo|
  name = repo.split('/').last
  git "/home/#{node[:user]}/.vim/bundle/#{name}" do
    repository "https://github.com/#{repo}.git"
    user node[:user]
    group node[:user]
  end
end
