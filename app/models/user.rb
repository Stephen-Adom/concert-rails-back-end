class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :reservations, dependent: :destroy, class_name: 'Reservation', foreign_key: 'user_id'
end
