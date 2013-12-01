apt_repository 'chrome' do
  uri 'http://dl.google.com/linux/chrome/deb/'
  key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  components ['stable', 'main']
end

package 'google-chrome-stable'
package 'imwheel'

file "/home/#{node[:user]}/.imwheelrc" do
  content <<-END.gsub(/^ {4}/, '')
    "^google-chrome$"
      None, Up, Button4, 2
      None, Down, Button5, 2
  END
  user node[:user]
  group node[:user]
end
