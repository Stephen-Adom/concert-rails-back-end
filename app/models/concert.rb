class Concert < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :band, presence: true
  validates :description, presence: true
  validates :artist, presence: true
  validates :image, presence: true

  has_many :concert_halls, class_name: 'ConcertHall', foreign_key: 'concert_id'
  has_many :reservations, through: :concert_halls
end
