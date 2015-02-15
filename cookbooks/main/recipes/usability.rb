def gsetting(scheme, key, value)
  cmd = "gsettings set #{scheme} #{key} '#{value}'"
  bash cmd do
    code cmd
    user node[:user]
    environment ENV.to_hash
  end
end


# disable gnome touchpad and keyboard settings
gsetting 'org.gnome.settings-daemon.plugins.mouse', 'active', false

# gnome forcefully overwrites xorg keyboard settings without ability to disable it
# gsetting 'org.gnome.settings-daemon.plugins.keyboard', 'active', false
# therefore we duplicate xorg keyboard settings with gnome
gsetting 'org.gnome.desktop.input-sources', 
  'xkb-options', '["grp:alt_shift_toggle", "ctrl:nocaps"]'
gsetting 'org.gnome.desktop.input-sources', 
  'sources', '[("xkb","us"), ("xkb","ru")]'

# setup touchpad
template '/etc/X11/xorg.conf.d/50-touchpad_and_keyboard.conf' do
  source 'touchpad_and_keyboard.conf'
end
# increase text size
gsetting 'org.gnome.desktop.interface', 'text-scaling-factor' , 1.4

package 'xbindkeys'
template "/home/#{node[:user]}/.xbindkeysrc" do
  source 'xbindkeysrc'
  user node[:user]
  group node[:user]
end
template "/home/#{node[:user]}/.xinitrc" do
  source 'xinitrc'
  user node[:user]
  group node[:user]
  mode '0755'
end
link "/home/#{node[:user]}/.xsession" do
  to "/home/#{node[:user]}/.xinitrc"
  user node[:user]
  group node[:user]
end
link "/home/#{node[:user]}/.xprofile" do
  to "/home/#{node[:user]}/.xinitrc"
  user node[:user]
  group node[:user]
end
link "/home/#{node[:user]}/.xsessionrc" do
  to "/home/#{node[:user]}/.xinitrc"
  user node[:user]
  group node[:user]
end
