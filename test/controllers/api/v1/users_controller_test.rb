require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_users_create_url
    assert_response :success
  end
end
