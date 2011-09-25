require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PurchaseHelper. For example:
#
# describe PurchaseHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  describe "authenticated?" do
    it "is true if @current_user" do
      helper.instance_variable_set :@current_user, FactoryGirl.create(:user)
      helper.authenticated?.should be_true
    end
    
    it "is false if not @current_user" do
      helper.instance_variable_set :@current_user, nil
      helper.authenticated?.should be_false
    end
  end
end
