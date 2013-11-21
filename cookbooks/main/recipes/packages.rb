execute 'upgrade packages' do
  command 'yum update -y'
end

%w[
  git
]
.each do |name|
  package name
end
