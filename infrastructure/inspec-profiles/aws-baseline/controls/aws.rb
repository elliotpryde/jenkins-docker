control 'iam_root_user_mfa' do
  title 'MFA should be enabled for the root user'
  desc 'This test assures that multi-factor authentication is enabled for the root AWS user.'
  impact 1.0

  describe aws_iam_root_user do
    it { should have_mfa_enabled }
  end
end

control 'iam_root_user_access_key_exists' do
  title 'Root user should have access key'
  desc 'This test assures that the root user has an access key available.'
  impact 1.0

  describe aws_iam_root_user do
    it { should have_access_key }
  end
end

