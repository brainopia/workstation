template '/etc/vimrc' do
  source 'vimrc'
end

%w[
  ~/.vim/autoload
  ~/.vim/plugged
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
  'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',

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
