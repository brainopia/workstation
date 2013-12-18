file '/etc/sysctl.d/60-optimization.conf' do
  content <<-END.gsub(/^ {4}/, '')
    vm.swappiness = 10
    vm.dirty_writeback_centisecs = 6000
  END
end

execute 'sysctl -p /etc/sysctl.d/60-optimization.conf'
