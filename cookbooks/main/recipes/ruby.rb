file "/home/#{node[:user]}/.gemrc" do
  content 'gem: --no-rdoc --no-ri'
  owner node[:user]
  group node[:user]
end

file "/home/#{node[:user]}/.irbrc" do
  content 'IRB.conf[:PROMPT_MODE] = :SIMPLE'
  owner node[:user]
  group node[:user]
end

file "/home/#{node[:user]}/.pryrc" do
  content <<-CODE
    require_relative 'code/ruby/debundle'
    Pry.config.prompt = Pry::SIMPLE_PROMPT
  CODE
  owner node[:user]
  group node[:user]
end

directory "/home/#{node[:user]}/.bundle" do
  owner node[:user]
  group node[:user]
end

file "/home/#{node[:user]}/.bundle/config" do
  content <<-END.gsub(/^ {4}/, '')
    ---
    BUNDLE_PATH: .bundle
  END
  owner node[:user]
  group node[:user]
end

remote_file "/home/#{node[:user]}/code/ruby/debundle.rb" do
  source 'https://raw.github.com/ConradIrwin/pry-debundle/master/lib/pry-debundle.rb'
  owner node[:user]
  group node[:user]
end

bash 'install gems' do
  user node[:user]
  flags '--login'
  code <<-SH
    source /usr/local/share/chruby/chruby.sh
    chruby ruby
    gem install pry-doc pry-docmore pry-editline \
                pry-byebug awesome_print \
                pry-pretty-numeric bond \
                pry-rescue pry-stack_explorer \
                pry-remote pry-vterm_aliases
  SH
end
