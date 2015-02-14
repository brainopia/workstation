def gsetting(scheme, key, value)
  bash key do
    code "gsettings set #{scheme} #{key} '#{value}'"
    user node[:user]
    environment ENV.to_hash
  end
end


# disable gnome touchpad settings
gsetting 'org.gnome.settings-daemon.plugins.mouse', 'active', false

# setup touchpad
template '/etc/X11/xorg.conf.d/50-synaptics.conf' do
  source 'synaptics.conf'
  user node[:user]
  group node[:user]
end

# increase text size
gsetting 'org.gnome.desktop.interface', 'text-scaling-factor' , 1.4
