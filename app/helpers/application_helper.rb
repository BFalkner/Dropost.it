module ApplicationHelper  
  def facebook_app_id
    FACEBOOK_CONFIG["app_id"]
  end
  
  def authenticated?
    @current_user
  end
end
