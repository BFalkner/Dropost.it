require 'spec_helper'

describe Vendor do
  it "should not allow duplicate slugs" do
    FactoryGirl.create :vendor, :slug => 'my_slug'
    vendor = FactoryGirl.build :vendor, :slug => 'my_slug'

    vendor.should_not be_valid
  end
end
