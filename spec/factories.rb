FactoryGirl.define do
  factory :vendor do
    name {|n| "Vendor #{n}"}
    address "123 N Blvd"
  end
  
  factory :user do
    
  end
end
