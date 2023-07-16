class ConcertHall < ApplicationRecord
  validates :date, presence: true

  belongs_to :city, class_name: 'City', foreign_key: 'city_id'
  belongs_to :concert, class_name: 'Concert', foreign_key: 'concert_id'
  has_many :reservations, class_name: 'Reservation', foreign_key: 'concert_hall_id'
end
