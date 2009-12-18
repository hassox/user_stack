require 'spec'
require 'rack/test'
require 'pancake'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'user_stack'

UserStack.initialize_stack(:master => true)

def app
  @app ||= UserStack.stackup(:master => true)
end

UDU = UserStack::DataMapper::User

Pancake.handle_errors!(true)

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)
  config.include(Pancake::Test::Matchers)
  config.before(:each){ UDU.auto_migrate! }
end

