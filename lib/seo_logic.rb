module SeoLogic
  extend ActiveSupport::Concern

  included do
    has_one :seo, as: :model, dependent: :destroy
    accepts_nested_attributes_for :seo
    attr_accessible :seo_attributes

    extend FriendlyId
    friendly_id :friendly_slug, use: :slugged
  end

  def friendly_slug
    self.seo.try(:slug).presence ||
      (self.name if respond_to?(:name)) ||
      (self.title if respond_to?(:title))
  end

  module ClassMethods
    def seo
      Seo.where{(model_type == my{name}) & (model_id == nil)}.first
    end
  end
end
