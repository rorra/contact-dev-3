class ApplicationController < ActionController::Base
  protect_from_forgery

  include SslRequirement

  include SimpleCaptcha::ControllerHelpers  
end
