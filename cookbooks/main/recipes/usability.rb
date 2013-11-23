def synclient(name, settings)
  arguments = settings.map {|key, value| "#{key}=#{value}" }.join(' ')
  execute name do
    command "synclient #{arguments}"
  end
end

synclient 'touchpad tap', TapButton1: 1, TapButton2: 3, TapButton3: 2
synclient 'natural scrolling', VertScrollDelta: -77, HorizScrollDelta: -77
synclient 'less sensitive tap', FingerHigh: 2
