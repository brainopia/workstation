file "/home/#{node[:user]}/.cvsignore" do
  content <<-END.gsub(/^ {4}/, '')
    .bundle
    *.swp
  END
  owner node[:user]
  group node[:user]
end

{
  'user.name'         => 'brainopia',
  'user.email'        => 'brainopia@evilmartians.com',
  'github.user'       => 'brainopia',
  'push.default'      => 'simple',
  'core.excludesfile' => '~/.cvsignore'
}
.each do |setting, value|
  execute "git #{setting}" do
    user node[:user]
    group node[:user]
    command "git config --file /home/#{node[:user]}/.gitconfig #{setting} #{value}"
  end
end
