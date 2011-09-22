class PurchaseController < ApplicationController
  def new
    vendor_slug = params[:vendor_slug]
    @vendor = Vendor.first(:conditions => {:slug => vendor_slug})
  end
  

end
