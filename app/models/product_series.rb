class ProductSeries < ActiveRecord::Base
  include SeoLogic
  attr_accessible :title, :manufacturer_id, :manufacturer

  belongs_to :manufacturer
  has_many :mattresses

  def name_with_manufacturer
    "#{title} (#{manufacturer.name})"
  end
end
