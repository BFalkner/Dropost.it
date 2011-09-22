require 'spec_helper'

describe PurchaseController do

  describe "GET 'new'" do
    it "should load the vendor from the slug" do
      vendor = FactoryGirl.create :vendor, :slug => "my-slug"
      get "new", :vendor_slug => "my-slug"
      assigns[:vendor].should == vendor
    end
  end

end
