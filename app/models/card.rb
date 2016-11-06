class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validate :check_original_and_translated_text
  def check_original_and_translated_text
    if (original_text == translated_text)
      errors.add(:original_text, "original_text cannot equal translated_text")
      errors.add(:translated_text, "translated_text cannot equal original_text")
    end
  end

  before_create :set_review_date
  def set_review_date
    self.review_date = Date.today + 3.days
   end
end
