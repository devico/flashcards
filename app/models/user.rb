class User < ApplicationRecord

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :decks, dependent: :destroy
  has_many :cards, through: :decks
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_uniqueness_of :email

end
