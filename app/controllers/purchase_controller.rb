class PurchaseController < ApplicationController
  
  def new
    @vendor = Vendor.find(params[:vendor][:id])
    @friend = FbGraph::User.fetch(params[:friend][:id], :access_token => @current_user.access_token)
  end

  
end
