synclient = {
  TapButton1: 1,          # touchpad tap
  TapButton2: 3,
  TapButton3: 2,
  VertScrollDelta: -77,   # natural scrolling
  HorizScrollDelta: -77,
  FingerHigh: 3,          # less sensitive tap
  TapAndDragGesture: 0,   # disable tap and drag
  PressureMotionMinZ: 40, # less sensitive motion
  PalmDetect: 1           # detect palm
}

file "/home/#{node[:user]}/.xinitrc" do
  action :create
  user node[:user]
  group node[:user]
  content synclient.map {|key, value| "synclient #{key}=#{value}" }.join("\n")
end

execute 'apply synclient' do
  command "bash /home/#{node[:user]}/.xinitrc"
end


def gsetting(scheme, key, value)
  bash key do
    code "gsettings set #{scheme} #{key} '#{value}'"
    user node[:user]
    environment ENV.to_hash
  end
end

gsetting 'org.gnome.desktop.interface', 'text-scaling-factor' , 1.4

package 'wmctrl'

shortcuts = [
  ['Skype', 'sh -c "wmctrl -xa skype.Skype || PULSE_LATENCY_MSEC=30 skype"', '<Alt>s'],
  ['Chrome', 'sh -c "wmctrl -xa google-chrome.Google-chrome || google-chrome"', '<Alt>d'],
  ['Terminator', 'sh -c "wmctrl -xa terminator.Terminator || terminator"', '<Alt>f']
]

paths = shortcuts.size.times.map do |i|
  "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom#{i}/"
end

gsetting 'org.gnome.settings-daemon.plugins.media-keys', 'custom-keybindings', paths

paths.each.with_index do |path, i|
  shortcut = shortcuts[i]
  scheme = "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:#{path}"
  gsetting scheme, 'name',    shortcut[0]
  gsetting scheme, 'command', shortcut[1]
  gsetting scheme, 'binding', shortcut[2]
end
