# rubies cookbook

This cookbook installs different ruby versions using ruby-install (https://github.com/postmodern/ruby-install), installs chruby (https://github.com/postmodern/chruby) for switching between rubies and optionally installs Bundler under those rubies.

My plan is to expand this to be able to specify a list of gems to install under all rubies, a list of gems for each ruby version and a LWRP for installing gems under each ruby version.

Also to do is to add tests.


# Requirements

The following cookbooks are required:

**build_essential** - install the required build tools & compilers - https://github.com/opscode-cookbooks/build-essential

**chruby_install** - install chruby. Not currently on the community site, but available here: https://github.com/ichilton/chef_chruby_install

**ruby_install** - install rubies using ruby-install - https://github.com/rosstimson/chef-ruby_install

**Currently only tested on Ubuntu 12.04**

The included Vagrantfile requires the vagrant-berkshelf and vagrant-omnibus plugins:

    vagrant plugin install vagrant-berkshelf
    vagrant plugin install vagrant-omnibus


# Usage

Set attributes in your attributes file, such as:

    default[:rubies][:list] = [ 'ruby 1.9.3-p194', 'ruby 2.0.0-p195' ]
    default[:rubies][:install_bundler] = true

Include the rubies default recipe (or include rubies in your run list):

    include_recipe 'rubies'


# Attributes

**node[:rubies][:list]** - array of ruby types/versions to install (defaults to: [ 'ruby 2.0.0-p195' ])

**node[:rubies][:install_bundler]** - boolean specifying whether to install bundler under each ruby version (defaults to: true). Note that this currently only works if you are listing full ruby versions (eg: 'ruby 2.0.0-p195').

The bundler install will not currently work with partial version numbers (eg: "ruby-install ruby" or "ruby-install ruby 1.9.3"), despite ruby-install supporting it. I'm working with Ross on support in the chef_ruby-install cookbook for this.

Note the attributes in the chruby_install cookbook (https://github.com/ichilton/chef_chruby_install) which you can set, for example setting the default ruby.


# Recipes

default


# Author

Author:: Ian Chilton (<ian@ichilton.co.uk>)
