dependencies = %w[
  libXv.i686
  libXScrnSaver.i686
  qt.i686
  qt-x11.i686
  pulseaudio-libs.x86_64
  pulseaudio-libs-glib2.i686
  alsa-plugins-pulseaudio.i686
  qtwebkit.i686
]
  
dependencies.each do |name|
  yum_package name
end

bash 'download skype' do
  cwd '/tmp'
  code <<-SH
    wget -c http://www.skype.com/go/getskype-linux-beta-fc10 -O skype.rpm
    yum install -y skype.rpm
  SH
  not_if 'rpm -qa | grep skype'
end
