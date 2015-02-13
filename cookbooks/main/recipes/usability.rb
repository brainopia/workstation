def synclient(name, settings)
  arguments = settings.map {|key, value| "#{key}=#{value}" }.join(' ')
  execute name do
    command "synclient #{arguments}"
  end
end

synclient 'touchpad tap', TapButton1: 1, TapButton2: 3, TapButton3: 2
synclient 'natural scrolling', VertScrollDelta: -77, HorizScrollDelta: -77
synclient 'less sensitive tap', FingerHigh: 3
synclient 'disable tap and drag', TapAndDragGesture: 0
synclient 'less sensitive motion', PressureMotionMinZ: 40
synclient 'detect palm', PalmDetect: 1


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
