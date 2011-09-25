class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :login
  
  private
  def login
    auth = FbGraph::Auth.new(FACEBOOK_CONFIG["app_id"],
                             FACEBOOK_CONFIG["secret"])
    auth.from_cookie(cookies)
    if auth.authorized?
      @current_user = User.login(auth)
    end
  rescue FbGraph::Auth::VerificationFailed,
         Rack::OAuth2::Client::Error
    @current_user = nil                        
  end
end
