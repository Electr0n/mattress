# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :size, :class => 'MattressStuff::Size' do
    sequence(:height) {|i| (1+rand(5)) * 100 }
    sequence(:width) {|i| (1+rand(5)) * 100 }
  end
end
