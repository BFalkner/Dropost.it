class Vendor < ActiveRecord::Base
  validates :slug, :uniqueness => true
end
