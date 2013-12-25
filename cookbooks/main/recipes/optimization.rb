file '/etc/sysctl.d/60-optimization.conf' do
  content <<-END.gsub(/^ {4}/, '')
    vm.swappiness = 10
    vm.dirty_writeback_centisecs = 6000
  END
end

execute 'sysctl -p /etc/sysctl.d/60-optimization.conf'

ruby_block 'edit grub' do
  block do
    grub = Chef::Util::FileEdit.new '/etc/default/grub'
    grub.search_file_delete_line /GRUB_CMDLINE_LINUX_DEFAULT/
    grub.write_file
  end
end

execute 'update-grub'
