class Api::V1::ReservationsController < ApplicationController
  def index
    reservations = Reservation.all

    reservations_data = reservations.map do |reservation|
      {
        id: reservation.id,
        name: reservation.user.name,
        concert_name: reservation.concert_hall.concert.name,
        concert_date: reservation.concert_hall.date,
        city_name: reservation.concert_hall.city.name
      }
    end

    render json: { reservations: reservations_data }
  end
end
