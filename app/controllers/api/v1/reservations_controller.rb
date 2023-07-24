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
                              user: {
                                id: @current_user.id,
                                name: @current_user.name
                              },
                              concert: {
                                id: reservation.concert_hall.concert.id,
                                name: reservation.concert_hall.concert.name,
                                date: reservation.concert_hall.date
                              },
                              concert_hall: {
                                id: reservation.concert_hall.id,
                                name: reservation.concert_hall.hall_name
                              },
                              city: {
                                name: reservation.concert_hall.city_name
                              }
                            }
                          end
                        end

    render json: { reservations: reservations_data }
  end

  def create
    concert_hall = ConcertHall.find(params[:reservation][:concert_hall_id])
    user = @current_user

    if concert_hall.total_seats > concert_hall.reserved_seats
      if user.reservations.where(concert_hall:).exists?
        render json: { error: 'You have already made a reservation at this concert hall' },
               status: :unprocessable_entity
      else
        reservation = Reservation.new(reservation_params)
        reservation.user = user

        if reservation.save
          concert_hall.increment!(:reserved_seats)
          render json: { message: 'Reservation created successfully' }, status: :created
        else
          render json: { error: 'Failed to create reservation' }, status: :unprocessable_entity
        end
      end
    else
      render json: { error: 'Not enough seats available in the concert hall' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :concert_hall_id)
  end
end
