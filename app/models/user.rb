class User < ActiveRecord::Base
  def self.login(auth)
    user = User.find_or_create_by_identifier(auth.user.identifier)
    user.access_token = auth.access_token
    user.instance_variable_set(:@fb_user, auth.user)
    user
  end

  def friends
    fb_user.friends
  end

  private
  def fb_user
    @fb_user ||= FbGraph::User.new(self.identifier, :access_token => self.access_token)
    @fb_user
  end
end
