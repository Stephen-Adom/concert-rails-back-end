class Api::V1::UsersController < ApplicationController
  before_action :create_admin_user, only: :create
  def create
    user = User.new(user_params)
  

    if user.save
      render json: user.send_user_information,
             status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :username, :password, :password_confirmation)
  end

end
