class Listing < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :city, optional: true
  has_many :reservations 

###########################################

  validates :available_beds,
  numericality: { greater_than_or_equal_to: 1, only_integer: true },
  presence: true

  validates :price,
  numericality: { greater_than_or_equal_to: 1, only_integer: true },
  presence: true

  validates :description,
    length: { in: 140..30000 }

  validates :has_wifi,
    inclusion: { in: [true, false] }

  validates :welcome_message,
    presence: true
end
