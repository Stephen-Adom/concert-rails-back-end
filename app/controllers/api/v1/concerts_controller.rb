class Api::V1::ConcertsController < ApplicationController
  def index
    concerts = Concert.includes(:cities).all
    render json: concerts.to_json(include: :cities)
  end
end
