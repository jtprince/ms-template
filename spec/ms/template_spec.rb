
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

require 'ms/template'

# bacon usage:
# http://chneukirchen.org/repos/bacon/README"
describe 'a ms-template' do
  it 'has a version' do
    require 'ms/template/version'
    Ms::Template::VERSION.should.match /^\d+\.\d+\.\d+$/
  end
end
