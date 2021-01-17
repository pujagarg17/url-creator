class Url < ApplicationRecord
  validates_presence_of :link
  validates :link, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug,:link
  before_validation :generate_slug
  has_many :stats, dependent: :destroy

  def generate_slug
    self.slug = SecureRandom.uuid[0..5] if self.slug.nil? || self.slug.empty?
    true
  end
end
