class Api::V1::ConcertsController < ApplicationController
  def index
    concerts = Concert.all
    render json: concerts
  end

  def show
    @concert = Concert.includes(:concert_halls).find(params[:id])

    render json: @concert.to_json(include: {concert_halls: {include: :city}})
  
  end
end
