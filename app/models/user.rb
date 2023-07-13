class User < ApplicationRecord
  has_secure_password
  before_create :generate_authentication_token

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :reservations, dependent: :destroy, class_name: 'Reservation', foreign_key: 'user_id'


  private

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.exists?(authentication_token:)
    end
  end
end
