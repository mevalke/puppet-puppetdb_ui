require 'spec_helper'
describe 'puppetdb_ui' do
  context 'with default values for all parameters' do
    it { should contain_class('puppetdb_ui') }
  end
end
