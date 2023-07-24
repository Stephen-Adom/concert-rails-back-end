class ConcertHall < ApplicationRecord
  validates :date, presence: true
  validates :total_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :reserved_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :hall_name, presence: true
  before_validation :set_default_reserved_seats

  belongs_to :concert, class_name: 'Concert', foreign_key: 'concert_id'
  has_many :reservations, class_name: 'Reservation', foreign_key: 'concert_hall_id'

  private

  def set_default_reserved_seats
    self.reserved_seats ||= 0
  end
end
