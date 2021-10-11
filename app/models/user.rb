class User < ApplicationRecord

  has_many :reservations, dependent: :destroy
  has_many :listings, dependent: :destroy

  #################################################

  validates :email,
    presence: true,
    uniqueness: true

  validates :phone_number,
    presence: true,
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }
end
