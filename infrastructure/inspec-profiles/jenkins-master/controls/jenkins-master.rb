control 'jenkins_master_is_running' do
  title 'The Jenkins master should be running'
  desc 'This test assures that the jenkins master container is running and available.'
  impact 0.7

  describe docker_image(repo: 'jenkins-master', tag: '0.1') do
    it { should exist }
  end

  describe docker_container('jenkins-master') do
    it { should exist }
    it { should be_running }
  end

  describe port (8080) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
  end

  describe port (5000) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
  end

end

include_controls 'debian-baseline'
