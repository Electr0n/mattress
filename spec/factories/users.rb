# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :aliases => [:admin] do
    sequence(:email) {|i| "user_#{i}@email.com" }
    password 'secret'
    password_confirmation 'secret'
  end
end
