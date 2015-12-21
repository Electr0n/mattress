class Seo < ActiveRecord::Base
  attr_accessible :description, :keywords, :model_id, :model_type, :slug, :title

  belongs_to :model, polymorphic: true

  def self.for(object)
    result = object.seo if object.respond_to?(:seo)
    result ||= case object
               when String
                 Seo.where{(model_type == object) & (model_id == nil)}.first
               when Hash
                 seo = Seo.where(object).first
                 if seo.nil? && defined?(object[:model_type])
                   possible_object = object[:model_type].constantize.where{(slug == my{object[:model_id]}) | (id == my{object[:model_id]})}.first rescue nil
                   seo = possible_object.try(:seo)
                 end
                 seo
               end
    result ||= Seo.default
    result
  end

  def self.default
    PagePart.seo
  end
end
