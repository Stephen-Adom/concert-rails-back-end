class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user_by_token!

  def index
    reservations = @current_user.reservations

    reservations_data = if reservations.empty?
                          []
                        else
                          reservations.map do |reservation|
                            {
                              id: reservation.id,
                              name: @current_user.name,
                              concert_name: reservation.concert_hall.concert.name,
                              concert_date: reservation.concert_hall.date,
                              city_name: reservation.concert_hall.city.name
                            }
                          end
                        end

    render json: { reservations: reservations_data }
  end
end
