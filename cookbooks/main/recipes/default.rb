%w[
  main::optimization
  main::ruby
  main::usability
  main::packages
  main::vim
  main::git
  main::ssh
  main::applications
  main::terminal
  main::docker
]
.each do |name|
  include_recipe name 
end

