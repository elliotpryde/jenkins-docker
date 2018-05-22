control 'os_is_linux' do
  title 'Operating system should be linux'
  desc 'This test assures that the linux distro is debian-based.'
  impact 1.0

  describe os[:family] do
    it { should eq 'debian' }
  end

  describe os.linux? do
    it { should eq true }
  end
end

control 'user_ubuntu_exists' do
  title 'The Ubuntu user should be present'
  desc 'This tests assures that the Ubuntu user exists.'
  impact 0.5

  describe passwd do
    its('users') { should include 'ubuntu' }
  end
end
