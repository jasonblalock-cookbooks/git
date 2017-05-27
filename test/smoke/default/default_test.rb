# # encoding: utf-8

# Inspec test for recipe git_ppa::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

describe apt('ppa:git-core/ppa') do
  it { should exist }
  it { should be_enabled }
end

describe package 'git' do
  it { should be_installed }
end
