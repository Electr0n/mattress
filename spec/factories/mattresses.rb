# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mattress do
    sequence(:title) {|i| "Mattress #{i}"}
    sequence(:price) { 1000 }
    sequence(:description) { 'description aaa' }
    short_description 'my short text'
  end
end
