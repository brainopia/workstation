apt_repository 'docker' do
  uri 'http://get.docker.io/ubuntu'
  key 'https://get.docker.io/gpg'
  components ['docker', 'main']
end

package 'lxc-docker'

execute 'service docker start'
