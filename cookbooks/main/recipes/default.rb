%w[
  main::rubygems
  rubies
  main::usability
  main::applications
]
.each do |name|
  include_recipe name 
end

