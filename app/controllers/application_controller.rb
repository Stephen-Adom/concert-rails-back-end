class ApplicationController < ActionController::API
  private

  def authenticate_user_by_token!
    token = request.headers['Authorization']&.split(' ')&.last
    @current_user = User.find_by(authentication_token: token)

<<<<<<< HEAD
    return unless token.blank? || @current_user.nil?

    render json: { error: 'Invalid credentials' }, status: :unauthorized
=======
    if token.blank? || @current_user.nil?
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    else
      render json: { message: "Welcome, #{current_user.name}!" }
    end
>>>>>>> 9d3ce4105ca99771f3dafd683ea742b46dfaf93c
  end
end
