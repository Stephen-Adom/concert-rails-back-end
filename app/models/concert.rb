class Concert < ApplicationRecord
  validates :name, presence: true
  validates :band, presence: true
  validates :description, presence: true
  validates :total_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :reserved_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :artist, presence: true
  validates :image, presence: true

  before_validation :set_default_reserved_seats

  has_many :concert_halls, class_name: 'ConcertHall', foreign_key: 'concert_id'
  has_many :cities, through: :concert_halls
  has_many :reservations, through: :concert_halls

  private

  def set_default_reserved_seats
    self.reserved_seats ||= 0
  end
end
