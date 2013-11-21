name             'chruby_install'
maintainer       'Ian Chilton'
maintainer_email 'ian@ichilton.co.uk'
license          'All rights reserved'
description      'Install chruby'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

supports 'ubuntu'
supports 'debian'
supports 'freebsd'
supports 'redhat'
supports 'centos'
supports 'fedora'
supports 'amazon'
supports 'scientific'
supports 'suse'
supports 'mac_os_x'

depends 'build-essential'

