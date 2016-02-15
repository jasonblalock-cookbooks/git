require 'spec_helper'

describe 'git::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  context 'using default attributes' do
    describe package('git') do
      it { should be_installed }
    end
  end
end
