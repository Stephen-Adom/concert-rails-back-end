class Api::V1::SessionsController < ApplicationController
  before_action :create_admin_user, only: :create
  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      user_info = user.send_user_information
      render json: user_info, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def session_params
    params.permit(:username, :password)
  end
end
