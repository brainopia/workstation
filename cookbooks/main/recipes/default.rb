%w[
  main::ruby
  rubies
  main::usability
  main::packages
  main::git
  main::chef
  main::ssh
  main::applications
]
.each do |name|
  include_recipe name 
end

