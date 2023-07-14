class Api::V1::ConcertsController < ApplicationController
  def index
    concerts = Concert.all
    render json: concerts
  end
end
