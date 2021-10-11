class Reservation < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :listing, optional: true

  ############################################

  validates :start_date,
    presence: true
  validates :end_date,
    presence: true
  validate :start_must_be_before_end_date

  private 

  def start_must_be_before_end_date # https://stackoverflow.com/questions/6401374/rails-validation-method-comparing-two-fields
    errors.add(:start_date, "must be before end date") unless
      start_date < end_date
  end 

  def duration
    (start_date...end_date).count
  end

end
