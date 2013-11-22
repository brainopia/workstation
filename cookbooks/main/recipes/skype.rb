apt_repository 'canonical_partner' do
  uri 'http://archive.canonical.com/ubuntu/'
  components ['saucy', 'partner']
end

package 'skype'
