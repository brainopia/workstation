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
  content 'Pry.config.prompt = Pry::SIMPLE_PROMPT'
  owner node[:user]
  group node[:user]
end
