require 'spec_helper'

describe VendorsController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should render existing vendors" do
      vendor = FactoryGirl.create :vendor
      get "index"
      assigns[:vendors].should include(vendor)
    end
  end

end
