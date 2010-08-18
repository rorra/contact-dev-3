# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ContactDev3::Application.initialize!


# Assets
ActionController::Base.asset_host = 'fisherhouse.org'