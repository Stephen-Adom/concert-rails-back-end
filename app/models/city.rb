class City < ApplicationRecord
  validates :name, presence: true

  has_many :concert_halls, class_name: 'ConcertHall', foreign_key: 'city_id'
  has_many :concerts, through: :concert_halls
end
