class Api::V1::ConcertsController < ApplicationController
  before_action :authenticate_user_by_token!, only: %i[create destroy all_concerts]
  before_action :user_must_be_admin, only: %i[create destroy all_concerts]
  def index
    concerts = Concert.where(active: true)
    render json: concerts
  end

  def all_concerts
    concerts = Concert.all.order(created_at: :desc)
    render json: concerts
  end

  def show
    @concert = Concert.find(params[:id])
    if @concert.active
      render json: @concert.to_json(include: :concert_halls)
    else
      render json: { error: 'Concert not found' }, status: :not_found
    end
  end

  def create
    if Concert.find_by(name: concert_params[:name])
      render json: { error: 'Concert already exists' }, status: :unprocessable_entity
    else
      concert = Concert.new(concert_params)
      if concert.save
        concert_hall_params.each do |concert_hall_param|
          concert.concert_halls.create(concert_hall_param)
        end
        render json: { message: 'Concert created' }, status: :created
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
    params.require(:concert).permit(:name, :band, :image, :description, :artist)
  end

  def concert_hall_params
    params.require(:concert_hall).map { |param| param.permit(:hall_name, :city_name, :date, :total_seats) }
  end
end
