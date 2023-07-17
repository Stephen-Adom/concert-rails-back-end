class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      render json: { authentication_token: user.authentication_token, user_id: user.id, name: user.name  }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def session_params
    params.permit(:username, :password)
  end
end
