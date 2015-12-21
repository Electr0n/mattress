# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_series do
    sequence(:title) {|i| "Product series #{i}"}
    manufacturer nil
  end
end
