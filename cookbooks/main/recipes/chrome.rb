apt_repository 'chrome' do
  uri 'http://dl.google.com/linux/chrome/deb/'
  key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  components ['stable', 'main']
end

package 'google-chrome-stable'
