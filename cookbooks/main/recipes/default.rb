%w[
  main::ruby
  rubies
  main::usability
  main::packages
  main::vim
  main::git
  main::chef
  main::ssh
  main::applications
  main::terminal
]
.each do |name|
  include_recipe name 
end

