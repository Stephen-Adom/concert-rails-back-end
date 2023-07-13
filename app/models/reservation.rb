class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :concert_hall, class_name: 'ConcertHall', foreign_key: 'concert_hall_id'
end
