file '/etc/sysctl.d/60-optimization.conf' do
  content <<-END.gsub(/^ {4}/, '')
    vm.swappiness = 40
    vm.dirty_writeback_centisecs = 3000
  END
end

execute 'sysctl -p /etc/sysctl.d/60-optimization.conf'


__END__
- switch to deadline scheduler
