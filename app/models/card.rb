class Card < ApplicationRecord
  belongs_to :deck
  mount_uploader :image, ImageUploader

  validates :original_text, :translated_text, :deck_id, presence: true
  validate :check_original_and_translated_text

  def check_original_and_translated_text
    return unless UnicodeUtils.downcase(original_text.strip) == UnicodeUtils.downcase(translated_text.strip)
    errors.add(:base, t('cards.error_base'))
  end

  before_create :set_review_date
  def set_review_date
    self.review_date = Date.today
  end
end
