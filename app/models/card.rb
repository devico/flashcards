class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :check_original_and_translated_text

  def check_original_and_translated_text
    if UnicodeUtils.downcase(original_text.strip) == UnicodeUtils.downcase(translated_text.strip)
      errors.add(:base, "original and translated text can’t be same")
    end
  end

  before_create :set_review_date
  def set_review_date
    self.review_date = Date.today + 3.days
  end
end
