class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user_by_token!

  def index
    reservations = @current_user.reservations.includes(concert_hall: :concert)
      .where(concert_halls: { concerts: { active: true } })


    reservations_data = if reservations.empty?
                          []
                        else
                          reservations.map do |reservation|
                            {
                              id: reservation.id,
                              name: @current_user.name,
                              concert_name: reservation.concert_hall.concert.name,
                              concert_date: reservation.concert_hall.date,
                              city_name: reservation.concert_hall.city_name
                            }
                          end
                        end

    render json: { reservations: reservations_data }
  end
end
