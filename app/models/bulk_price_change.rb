class BulkPriceChange
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :percents, :round_to, :ids

  validates :percents, :numericality => true

  validate :validate_percents_range

  def initialize(attributes = {})
    attrs = attributes.symbolize_keys
    attrs.reverse_merge!(defaults)
    [:percents, :round_to].each do |attr|
      attrs[attr] = (attrs[attr] || 0).to_f
    end
    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
    if self.valid?
      update_prices
      true
    else
      false
    end
  end

  def update_prices
    mattresses = Mattress.where(id: ids)
    multiplier = ( 1 + self.percents / 100.0 )
    mattresses.find_each do |mattress|
      mattress.price = new_price_for(mattress.price, multiplier)
      mattress.save
    end
  end

  def new_price_for(old_price, multiplier)
      new_price = old_price.to_f * multiplier
      (new_price.to_f / self.round_to).round * self.round_to
  end

  def persisted?
    false
  end

  def defaults
    {
      percents: 0,
      round_to: 1000
    }
  end

  def validate_percents_range
    errors.add(:percents, "can't be less than -100%") if self.percents < -100
  end
end
