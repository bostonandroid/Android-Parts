# Load the rails application
require File.expand_path('../application', __FILE__)

Androidparts::Application.configure do
  config.middleware.use Rack::OpenID
end

# Initialize the rails application
Androidparts::Application.initialize!
