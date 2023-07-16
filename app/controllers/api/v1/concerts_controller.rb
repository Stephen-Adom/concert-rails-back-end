class Api::V1::ConcertsController < ApplicationController
  before_action :authenticate_user_by_token!, only: %i[create destroy]
  def index
    concerts = Concert.all
    render json: concerts
  end

  def create
    if Concert.find_by(name: concert_params[:name])
      render json: { error: 'Concert already exists' }, status: :unprocessable_entity
    else
      concert = Concert.new(concert_params)
      if concert.save
        concert.concert_halls.create(concert_hall_params)
        render json: concert, status: :created
      else
        render json: concert.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if Concert.find_by(id: params[:id])
      concert = Concert.find(params[:id])
      concert.active = false
      concert.save
      render json: { message: 'Concert marked deleted' }, status: :ok
    else
      render json: { error: 'Concert not found' }, status: :not_found
    end
  end

  private

  def concert_params
    params.require(:concert).permit(:name, :band, :image, :description, :total_seats, :artist)
  end

  def concert_hall_params
    params.require(:concert_hall).permit(:city_id, :date)
  end
end
