$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
#require 'rails/all'
require 'redis'
require 'rollout'
require 'rollout_js'

require "v8"

def jscontext
  @context ||= V8::Context.new
end

def evaljs(string)
  jscontext.eval(string)
end

RSpec.configure do |config|
  config.mock_with :mocha
  config.before { Redis.new.flushdb }
  config.before(:each) do
    evaljs("var window = this;")
  end
end

