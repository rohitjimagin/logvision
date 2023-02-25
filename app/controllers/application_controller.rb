class ApplicationController < ActionController::Base
  # disable CSRF protection
  # protect_from_forgery with: :null_session
  # disable invalid authenticity token exception
  # rescue_from ActionController::InvalidAuthenticityToken, with: :invalid_authenticity_token
  
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }


end
