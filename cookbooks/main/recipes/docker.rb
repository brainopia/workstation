remote_file '/etc/yum.repos.d/docker-goldmann.repo' do
  source 'http://goldmann.fedorapeople.org/repos/docker.repo'
  action :create_if_missing
end

package 'docker-io'
