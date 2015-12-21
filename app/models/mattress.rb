class Mattress < ActiveRecord::Base
  include SeoLogic
  attr_accessible :description, :title, #:price_for_sizes_attributes
    :short_description, :price, :product_series_id, :image, :big_image,
    :image_cache, :remove_image, :big_image_cache, :remove_big_image,
    :best_selled, :width, :height, :hardness

  has_many :price_for_sizes, :class_name => 'MattressStuff::PriceForSize'
  accepts_nested_attributes_for :price_for_sizes

  belongs_to :product_series
  has_one :manufacturer, :through => :product_series

  mount_uploader :image, MattressImageUploader
  mount_uploader :big_image, MattressBigImageUploader

  validates :title, :short_description, :description, :product_series_id,  :presence => true
  before_validation :convert_price

  scope :best_selled, where(:best_selled => true).order('mattresses.best_selled_from DESC').limit(4)
  scope :front_listing, order("mattresses.created_at DESC")

  before_save :update_best_selled_from, :if => :best_selled_changed_to_true?

  def best_selled_changed_to_true?
    best_selled_changed? && best_selled
  end

  def update_best_selled_from
    self.best_selled_from = Time.now
  end

  def convert_price
    self.price = price_before_type_cast.gsub(/\s+/, '') if price_before_type_cast.respond_to?(:gsub)
  end
end
