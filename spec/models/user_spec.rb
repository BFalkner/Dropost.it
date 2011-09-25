require 'spec_helper'

def auth_stub(params)
  stub(
  :user => stub(:identifier => params.fetch(:identifier, "12345")),
  :access_token => params.fetch(:access_token, "67890"))
end

describe User do
  it "is created from the auth token with correct identifier" do
    identifier = "123345"
    auth = auth_stub(:identifier => identifier)
    user = User.login(auth) 
    user.identifier.should == identifier 
  
  end
  
  it "is created from the auth token with correct access_token" do
  
  access_token = "123456"
  auth = auth_stub(:access_token => access_token)
  user = User.login(auth)
  user.access_token.should == access_token   
    
  end
  
  it "is loaded from the auth identifier" do
    identifier = "12345"
    user = FactoryGirl.create :user, :identifier => identifier
    auth = auth_stub(:identifier => identifier)
    
    logged_in_user = User.login(auth)
    logged_in_user.should == user
  end
  
  it "is set with new access_token when loaded" do
    new_access_token = "12345"
    user = FactoryGirl.create :user, :access_token => "abcde"
    auth = auth_stub(:identifier => user.identifier, :access_token => new_access_token)
    
    logged_in_user = User.login(auth)
    logged_in_user.access_token.should == new_access_token
  end
end
