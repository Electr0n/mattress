# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mattress_stuff_price_for_size, :class => 'MattressStuff::PriceForSize' do
    price "9.99"
    size ""
    mattress nil
  end
end
