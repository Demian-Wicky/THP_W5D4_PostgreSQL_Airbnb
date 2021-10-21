class Reservation < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :listing, optional: true

  ############################################

  validates :start_date,
    presence: true
  validates :end_date,
    presence: true
    
  validate :start_must_be_before_end_date
  validate :start_must_be_in_future
  validate :check_overlap

  def duration
    (end_date.to_i - start_date.to_i)/(3600*24)
  end

  def period
    start_date..end_date
  end

  private  ###################################

  def start_must_be_before_end_date # https://stackoverflow.com/questions/6401374/rails-validation-method-comparing-two-fields
    unless start_date < end_date
      errors.add(:start_must_be_before_end_date, "Start must be before end date") 
    end
  end 

  def start_must_be_in_future
    unless Time.now() < start_date
      errors.add(:start_must_be_in_future, "Start must be in future") 
    end
  end

  def check_overlap #https://railsguides.net/date-ranges-overlap/
    other_reservations = listing.reservations
    is_overlapping = other_reservations.any? do |other_reservation|
      period.overlaps?(other_reservation.period)
    end
    errors.add(:check_overlap, "Reservation overlaps")  if is_overlapping
  end

end
