# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) {|i| "Manufacturer #{i}"}
  end
end
