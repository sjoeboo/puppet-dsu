require 'spec_helper'
describe 'dsu' do

  context 'with defaults for all parameters' do
    it { should contain_class('dsu') }
  end
end
