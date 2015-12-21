class MattressStuff::PriceForSize < ActiveRecord::Base
  belongs_to :mattress
  belongs_to :size, :class_name => 'MatressStuff::Size'
  attr_accessible :price, :size_id, :mattress_id
end
