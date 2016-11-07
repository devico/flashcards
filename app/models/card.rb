class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :check_original_and_translated_text

  def check_original_and_translated_text
    if (original_text.downcase.strip == translated_text.downcase.strip)
      errors.add(:original_text, "original text can’t be same as translated")
      errors.add(:translated_text, "translated text can’t be same as original")
    end
  end

  before_create :set_review_date
  def set_review_date
    self.review_date = Date.today + 3.days
  end
end
