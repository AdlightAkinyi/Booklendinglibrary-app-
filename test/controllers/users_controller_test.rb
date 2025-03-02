# require "test_helper"

# class UsersControllerTest < ActionDispatch::IntegrationTest
#   test "should get show" do
#     get users_show_url
#     assert_response :success
#   end
# end

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Include Devise helpers only here

  def setup
    @user = users(:one) # Load user from fixtures
    sign_in @user       # Use Devise helper to log in
  end

  test "should get show" do
    get user_path(@user) # Adjust the route if needed
    assert_response :success
  end
end




