class Manufacturer < ActiveRecord::Base
  include SeoLogic
  attr_accessible :logo, :name, :logo_cache, :remove_logo
  mount_uploader :logo, ManufacturerLogoUploader

  has_many :product_serieses, :class_name => 'ProductSeries'
  has_many :mattresses, :through => :product_serieses

  scope :for_header, order('id ASC').limit(4)
end
