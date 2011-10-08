require 'spec_helper'
require 'fb_helper'

describe PurchaseController do
  around do |example|
    @old_auth = FbGraph::Auth
    FbGraph::Auth = MockAuth

    example.run

    FbGraph::Auth = @old_auth
  end

  describe "GET 'new'" do
    def get_new_params overrides
      vendor = overrides.fetch :vendor, FactoryGirl.create(:vendor)
      friend = overrides.fetch :friend, MockFbUser.new("stubbed_friend_id")
      {:vendor => {:id => vendor.id},
       :friend => {:id => friend.identifier}}
    end

    def stub_fetch(stubbed_user = stub(:identifier => "stubbed_friend_id"))
      stubbed_user_class = stub("fb_user")
      stubbed_user_class.should_receive(:fetch)
        .with(stubbed_user.identifier, :access_token => MockAuth.new(nil, nil).access_token)
        .and_return(stubbed_user)

      @old_user_class = FbGraph::User
      FbGraph.const_set :User, stubbed_user_class

      yield

      FbGraph.const_set :User, @old_user_class
    end

    it "should load the vendor" do
      vendor = FactoryGirl.create :vendor
      stub_fetch {get "new", get_new_params(:vendor => vendor)}
      assigns[:vendor].should == vendor
    end

    it "should load the friend from Facebook" do
      friend = stub(:identifier => "friend_id")
      stub_fetch(friend) do
        get "new", get_new_params(:friend => friend)
      end
      assigns[:friend].should == friend
    end
  end

end
