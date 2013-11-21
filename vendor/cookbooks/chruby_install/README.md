# chruby_install cookbook

A cookbook to install chruby (https://github.com/postmodern/chruby) - a simple script to change the current Ruby.

This cookbook is an alternative to the chruby cookbook produced by my friend Stephen Nelson-Smith (@LordCope) of Atalanta Systems, which is available here: https://github.com/Atalanta/chef-chruby

I did take inspiration from the above cookbook, but this cookbook takes a slightly different approach, in that:

 - it installs from git and can be kept up-to-date

 - Although you can include it in a run list to simply install chruby, it's really intended to be used from a wrapper cookbook (such as: https://github.com/ichilton/chef_rubies) so doesn't do anything with regards to installing rubies - I prefer to use the LWRP's provided by the ruby-build or ruby_install cookbooks for this, like my wrapper cookbook (https://github.com/ichilton/chef_rubies) does:
   - https://github.com/rosstimson/chef-ruby_install
   - https://github.com/fnichol/chef-ruby_build

 - it doesn't use the ark cookbook so doesn't result in /usr/local/chruby-1 and a /usr/local/chruby symlink.

 - default to no default ruby

 - allows adding the chef embedded ruby to be optional

 - ensures the auto selection script (auto.sh) is loaded after selecting a default ruby, so the default ruby does not override the version in .ruby-install


Thanks to Fletcher Nicol (@fnicol) for inspiration on using the git repo as per the ruby-build cookbook.

TODO: Add tests


# Requirements

There is a single dependency - the build_essential cookbook (https://github.com/opscode-cookbooks/build-essential).

It also ensures git is installed from the distribution packages.

Note that as mentioned above, this cookbook doesn't handle installing rubies so you need to use ruby_install (https://github.com/postmodern/ruby-install), ruby-build (https://github.com/sstephenson/ruby-build), the cookbooks for them as mentioned above or another method to get your required rubies into /opt/rubies or ~/.rubies.

**Only currently tested on Ubuntu 12.04!**


# Usage

Override any attributes required (see: attributes/default.rb) and either include chruby_install in your run list or include_recipe 'chruby_install' in your recipe.


# Attributes

**node[:chruby_install][:git_url]** - The url of the git repository for chruby (defaults to: https://github.com/postmodern/chruby.git)

**node[:chruby_install][:git_ref]** - The git ref (branch, tag or commit) to use (defaults to: master)

**node[:chruby_install][:auto_upgrade]** - A boolean specifying whether chruby should just be installed (false) or kept up-to-date (true). The default is: false.

**node[:chruby_install][:git_packages]** - A list of packages to install for git. This defaults to 'git' or 'git-core', depending on the OS.

**node[:chruby_install][:use_embedded]** - Add the ruby that is installed by the chef omnibus installer to the list of available rubies (defaults to: false)

**node[:chruby_install][:use_rvm]** - Add any rubies installed by rvm to the list of available rubies (defaults to: false)

**node[:chruby_install][:use_rbenv]** - Add any rubies installed by rbenv to the list of available rubies (defaults to: false)

**node[:chruby_install][:use_rbfu]** - Add any rubies installed by rbfu to the list of available rubies (defaults to: false)

**node[:chruby_install][:default_ruby]** - Automatically switch to a specified ruby when logging in. The default is: false.

**node[:chruby_install][:auto]** - Automatically switch to the ruby specified in a .ruby-version file. The default is: true.


# Recipes

default - installs chruby


# Author

Author:: Ian Chilton (<ian@ichilton.co.uk>)

