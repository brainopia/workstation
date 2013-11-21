name             'rubies'
maintainer       'Ian Chilton'
maintainer_email 'ian@ichilton.co.uk'
license          'All rights reserved'
description      'Installs different Ruby versions, chruby for switching and any gems required'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'build-essential'
depends 'chruby_install'
depends 'ruby_install'

supports 'ubuntu'

