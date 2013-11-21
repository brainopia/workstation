bash 'enable touchpad tap' do
  code 'synclient TapButton1=1 TapButton2=3 TapButton3=2'
end

bash 'enable natural scrolling' do
  code 'synclient VertScrollDelta=-77 HorizScrollDelta=-77'
end
