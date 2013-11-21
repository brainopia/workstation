yum_key 'google-key' do
  url 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
end

yum_repository 'chrome' do
  repo_name 'google-chrome'
  description 'google chrome 64bit'
  url 'http://dl.google.com/linux/chrome/rpm/stable/x86_64'
  key 'google-key'
end

package 'google-chrome-stable'
