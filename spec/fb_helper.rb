
class MockFbUser
  attr_accessor :identifier

  def initialize identifier = "mock_identifier"
    self.identifier = identifier
  end
end

class MockAuth
  def initialize app_id, secret

  end

  def from_cookie cookie

  end

  def authorized?
    true
  end

  def access_token
    "1234"
  end

  def user
    @user ||= MockFbUser.new
  end

  class VerificationFailed; end
end
