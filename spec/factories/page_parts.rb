# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page_part do
    sequence(:key) {|i| "page_part_#{i}" }
    sequence(:title) {|i| "Page Part #{i}" }
    sequence(:content) {|i| "MyText #{i}"}
  end
end
