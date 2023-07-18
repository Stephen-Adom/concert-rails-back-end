class ApplicationController < ActionController::API
  private

  def authenticate_user_by_token!
    @token = request.headers['Authorization']&.split(' ')&.last
    @current_user = User.find_by(authentication_token: @token)

    return unless @token.blank? || @current_user.nil?

    render json: { error: 'Invalid credentials', hh: @token }, status: :unauthorized
  end

  def create_admin_user
    return unless User.find_by(username: 'admin').nil?

    User.create(username: 'admin', password: 'admin', role: 'admin', name: 'admin', email: 'admin@admin.com')
  end
end
