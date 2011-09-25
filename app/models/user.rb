class User < ActiveRecord::Base
  def self.login(auth)
    user = User.find_or_create_by_identifier(auth.user.identifier)
    user.access_token = auth.access_token
    user
  end
end
