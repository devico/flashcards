class SendNotification
  include Interactor
  def call
    users = Card.where("review_date <= ?", Time.current)
                .where.not(user_id: nil).group(:user_id).pluck(:user_id)

    users.each do |id|
      user = User.find(id)
      CardsMailer.pending_cards_notification(user).deliver
    end
  end
end
