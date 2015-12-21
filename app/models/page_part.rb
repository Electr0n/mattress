class PagePart < ActiveRecord::Base
  include SeoLogic

  attr_accessible :content, :key, :title, :intro
  validate :key,
    :presence => true,
    :uniqueness => true

  before_validation :set_uniq_key, :if => :new_record?

  PART_KEYS = %w[
    phones_header phones_footer copyright banner
  ]
  DEFAULT_PAGES = %w[
    about payment_and_delivery contact_info
  ]
  DEFAULT_KEYS = PART_KEYS + DEFAULT_PAGES

  scope :articles, where("page_parts.key NOT IN (?)", DEFAULT_KEYS)

  scope :deletable, articles

  scope :other_than, ->(exclusion) { where("page_parts.id NOT IN (?)", exclusion) }

  def self.[](key)
    key = key.to_s
    logger.info('Looking for %s, but not found' % key) unless  self.find_by_key(key).try(:content)

    self.find_by_key(key)
  end

  def default?
    DEFAULT_KEYS.include?(self.key)
  end

  def deletable?
    !default?
  end

  def to_s
    self.content || ''
  end

  protected
  def set_uniq_key
    self.key ||= SecureRandom.hex
  end
end
