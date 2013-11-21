# package 'wine'

# configure --enable-win64
# dependencies libX11-devel, freetype-devel
ark 'wine' do
  url 'http://prdownloads.sourceforge.net/wine/wine-1.6.1.tar.bz2'
  version '1.6.1'
  action [:configure, :install_with_make]
  has_binaries ['wine']
end

remote_file '/tmp/pokerstars.exe' do
  source 'http://www.pokerstars.com/PokerStarsInstall.exe'
  action :create_if_missing
end

execute 'install pokerstars' do
  command 'wine /tmp/pokerstars.exe'
end
