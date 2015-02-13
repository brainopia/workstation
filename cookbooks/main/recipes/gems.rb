bash 'install gems' do
  user node[:user]
  flags '--login'
  code <<-SH
    gem install pry-doc pry-docmore pry-editline \
                pry-byebug awesome_print \
                pry-pretty-numeric bond \
                pry-rescue pry-stack_explorer \
                pry-remote pry-vterm_aliases \
                pry-syntax-hacks
  SH
end
