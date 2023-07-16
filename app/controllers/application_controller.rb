class ApplicationController < ActionController::API
  private

  def authenticate_user_by_token!
    token = request.headers['Authorization']&.split(' ')&.last
    @current_user = User.find_by(authentication_token: token)

    return unless token.blank? || @current_user.nil?

    render json: { error: 'Invalid credentials' }, status: :unauthorized
  end
end
